% Simulink Enumeration
% Project Name
% Author
% mm-dd-yyyy

classdef EnumeratedClass < Simulink.IntEnumType
    % "EnumeratedClass" is the enumeration name
    % Simulink.IntEnumType default is int32
    % Option: Replace Simulink.IntEnumType with built-in data type:
    %   int8, unit8, int16, unit16, int32

    enumeration % Defines enumerated name (Active) and underlying integer
        Active (1)
        Inactive(2)
        Disabled(3)
        Limited(4)
        Blocked(5)
        TiedDown(6)
        CriticalLevel(7)
        LimpMode(8)
        SystemError(9)
        EStopped(10)
    end

    methods (Static = true)
        
        function InitVal = getDefaultValue()
            % Specifies the default enumeration member of the class
            % Returns a valid member of this enumeration class to specify
            % default
            % Default to first member of enumeration definition if
            % unspecified

            InitVal = EnumeratedClass.Inactive;
        end

        function EnumDescript = getDescription()
            % Specifies a string to describe this enumerated type
            % Returns a string containing the description

            EnumDescript = 'This is the enumeration description';

        end

        function retVal = addClassNameToEnumNames()
            % Specifies whether to add the class name as a prefix to
            % enumeration member names in generated code
            % Returns true or false
            % True = prefix added
            % False = no prefix added
            % Default value is false

            retVal = true;
        end
    end
end
