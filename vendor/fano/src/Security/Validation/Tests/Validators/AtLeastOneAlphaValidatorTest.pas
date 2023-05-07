{*!
 * Fano Web Framework (https://fanoframework.github.io)
 *
 * @link      https://github.com/fanoframework/fano
 * @copyright Copyright (c) 2018 - 2022 Zamrony P. Juhara
 * @license   https://github.com/fanoframework/fano/blob/master/LICENSE (MIT)
 *}

unit AtLeastOneAlphaValidatorTest;

interface

{$MODE OBJFPC}
{$H+}

uses

    fpcunit,
    testregistry,
    RegexIntf,
    ListIntf,
    ReadOnlyListIntf,
    ValidatorIntf,
    RequestIntf,
    BaseValidatorTest;

type

    (*!------------------------------------------------
     * test case for class having capability to validate
     * that input data at least contains one letter character
     *--------------------------------------------------
     * @author Zamrony P. Juhara <zamronypj@yahoo.com>
     *-------------------------------------------------*)
    TAtLeastOneAlphaValidatorTest = class(TBaseValidatorTest)
    protected
        function buildValidator() : IValidator; override;
    published
        procedure TestInputContainsOneAlphaShouldPass();
        procedure TestInputContainsDigitsShouldFails();
        procedure TestSymbolOnlyInputShouldFails();
        procedure TestSymbolWithAlphaInputShouldPass();
        procedure TestOneAlphaInputShouldPass();
        procedure TestMixedAlphaCapsInputShouldPass();
    end;

implementation

uses

    AtLeastOneAlphaValidatorImpl,
    RegexImpl;

    function TAtLeastOneAlphaValidatorTest.buildValidator() : IValidator;
    begin
        result := TAtLeastOneAlphaValidator.create(TRegex.create());
    end;

    procedure TAtLeastOneAlphaValidatorTest.TestInputContainsOneAlphaShouldPass();
    var resValid : boolean;
    begin
        resValid := fValidator.isValid('my_key', fData, fRequest);
        AssertEquals(true, resValid);
    end;

    procedure TAtLeastOneAlphaValidatorTest.TestInputContainsDigitsShouldFails();
    var resValid : boolean;
    begin
        resValid := fValidator.isValid('my_digit', fData, fRequest);
        AssertEquals(false, resValid);
    end;

    procedure TAtLeastOneAlphaValidatorTest.TestSymbolOnlyInputShouldFails();
    var resValid : boolean;
    begin
        resValid := fValidator.isValid('my_symbol', fData, fRequest);
        AssertEquals(false, resValid);
    end;

    procedure TAtLeastOneAlphaValidatorTest.TestSymbolWithAlphaInputShouldPass();
    var resValid : boolean;
    begin
        resValid := fValidator.isValid('my_letter_symbol', fData, fRequest);
        AssertEquals(true, resValid);
    end;

    procedure TAtLeastOneAlphaValidatorTest.TestOneAlphaInputShouldPass();
    var resValid : boolean;
    begin
        resValid := fValidator.isValid('my_a', fData, fRequest);
        AssertEquals(true, resValid);
    end;

    procedure TAtLeastOneAlphaValidatorTest.TestMixedAlphaCapsInputShouldPass();
    var resValid : boolean;
    begin
        resValid := fValidator.isValid('my_abcd', fData, fRequest);
        AssertEquals(true, resValid);
    end;

initialization

    RegisterTest(TAtLeastOneAlphaValidatorTest);

end.
