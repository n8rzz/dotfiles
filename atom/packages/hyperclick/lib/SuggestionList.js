Object.defineProperty(exports, '__esModule', {
  value: true
});

/*
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the license found in the LICENSE file in
 * the root directory of this source tree.
 */

var _createClass = (function () { function defineProperties(target, props) { for (var i = 0; i < props.length; i++) { var descriptor = props[i]; descriptor.enumerable = descriptor.enumerable || false; descriptor.configurable = true; if ('value' in descriptor) descriptor.writable = true; Object.defineProperty(target, descriptor.key, descriptor); } } return function (Constructor, protoProps, staticProps) { if (protoProps) defineProperties(Constructor.prototype, protoProps); if (staticProps) defineProperties(Constructor, staticProps); return Constructor; }; })();

function _interopRequireDefault(obj) { return obj && obj.__esModule ? obj : { 'default': obj }; }

function _classCallCheck(instance, Constructor) { if (!(instance instanceof Constructor)) { throw new TypeError('Cannot call a class as a function'); } }

var _assert = require('assert');

var _assert2 = _interopRequireDefault(_assert);

'use babel';

var SuggestionList = (function () {
  function SuggestionList() {
    _classCallCheck(this, SuggestionList);
  }

  _createClass(SuggestionList, [{
    key: 'show',
    value: function show(textEditor, suggestion) {
      if (!textEditor || !suggestion) {
        return;
      }

      this._textEditor = textEditor;
      this._suggestion = suggestion;

      this.hide();

      var range = suggestion.range;

      (0, _assert2['default'])(range);

      var _ref = Array.isArray(range) ? range[0] : range;

      var position = _ref.start;

      this._suggestionMarker = textEditor.markBufferPosition(position);
      if (this._suggestionMarker) {
        this._overlayDecoration = textEditor.decorateMarker(this._suggestionMarker, {
          type: 'overlay',
          item: this
        });
      }
    }
  }, {
    key: 'hide',
    value: function hide() {
      // $FlowFixMe method override not working with `this`.
      atom.views.getView(this).dispose();
      if (this._suggestionMarker) {
        this._suggestionMarker.destroy();
      } else if (this._overlayDecoration) {
        this._overlayDecoration.destroy();
      }
      this._suggestionMarker = undefined;
      this._overlayDecoration = undefined;
    }
  }, {
    key: 'getTextEditor',
    value: function getTextEditor() {
      return this._textEditor;
    }
  }, {
    key: 'getSuggestion',
    value: function getSuggestion() {
      return this._suggestion;
    }
  }]);

  return SuggestionList;
})();

exports['default'] = SuggestionList;
module.exports = exports['default'];
//# sourceMappingURL=data:application/json;base64,eyJ2ZXJzaW9uIjozLCJzb3VyY2VzIjpbIi9Vc2Vycy9hc3VhcmV6L0Rlc2t0b3AvaHlwZXJjbGljay9saWIvU3VnZ2VzdGlvbkxpc3QuanMiXSwibmFtZXMiOltdLCJtYXBwaW5ncyI6Ijs7Ozs7Ozs7Ozs7Ozs7Ozs7O3NCQWFzQixRQUFROzs7O0FBYjlCLFdBQVcsQ0FBQzs7SUFlUyxjQUFjO1dBQWQsY0FBYzswQkFBZCxjQUFjOzs7ZUFBZCxjQUFjOztXQU03QixjQUFDLFVBQTJCLEVBQUUsVUFBZ0MsRUFBUTtBQUN4RSxVQUFJLENBQUMsVUFBVSxJQUFJLENBQUMsVUFBVSxFQUFFO0FBQzlCLGVBQU87T0FDUjs7QUFFRCxVQUFJLENBQUMsV0FBVyxHQUFHLFVBQVUsQ0FBQztBQUM5QixVQUFJLENBQUMsV0FBVyxHQUFHLFVBQVUsQ0FBQzs7QUFFOUIsVUFBSSxDQUFDLElBQUksRUFBRSxDQUFDOztVQUVMLEtBQUssR0FBSSxVQUFVLENBQW5CLEtBQUs7O0FBQ1osK0JBQVUsS0FBSyxDQUFDLENBQUM7O2lCQUNTLEtBQUssQ0FBQyxPQUFPLENBQUMsS0FBSyxDQUFDLEdBQUcsS0FBSyxDQUFDLENBQUMsQ0FBQyxHQUFHLEtBQUs7O1VBQW5ELFFBQVEsUUFBZixLQUFLOztBQUNaLFVBQUksQ0FBQyxpQkFBaUIsR0FBRyxVQUFVLENBQUMsa0JBQWtCLENBQUMsUUFBUSxDQUFDLENBQUM7QUFDakUsVUFBSSxJQUFJLENBQUMsaUJBQWlCLEVBQUU7QUFDMUIsWUFBSSxDQUFDLGtCQUFrQixHQUFHLFVBQVUsQ0FBQyxjQUFjLENBQUMsSUFBSSxDQUFDLGlCQUFpQixFQUFFO0FBQzFFLGNBQUksRUFBRSxTQUFTO0FBQ2YsY0FBSSxFQUFFLElBQUk7U0FDWCxDQUFDLENBQUM7T0FDSjtLQUNGOzs7V0FFRyxnQkFBRzs7QUFFTCxVQUFJLENBQUMsS0FBSyxDQUFDLE9BQU8sQ0FBQyxJQUFJLENBQUMsQ0FBQyxPQUFPLEVBQUUsQ0FBQztBQUNuQyxVQUFJLElBQUksQ0FBQyxpQkFBaUIsRUFBRTtBQUMxQixZQUFJLENBQUMsaUJBQWlCLENBQUMsT0FBTyxFQUFFLENBQUM7T0FDbEMsTUFBTSxJQUFJLElBQUksQ0FBQyxrQkFBa0IsRUFBRTtBQUNsQyxZQUFJLENBQUMsa0JBQWtCLENBQUMsT0FBTyxFQUFFLENBQUM7T0FDbkM7QUFDRCxVQUFJLENBQUMsaUJBQWlCLEdBQUcsU0FBUyxDQUFDO0FBQ25DLFVBQUksQ0FBQyxrQkFBa0IsR0FBRyxTQUFTLENBQUM7S0FDckM7OztXQUVZLHlCQUFnQjtBQUMzQixhQUFPLElBQUksQ0FBQyxXQUFXLENBQUM7S0FDekI7OztXQUVZLHlCQUEwQjtBQUNyQyxhQUFPLElBQUksQ0FBQyxXQUFXLENBQUM7S0FDekI7OztTQTlDa0IsY0FBYzs7O3FCQUFkLGNBQWMiLCJmaWxlIjoiL1VzZXJzL2FzdWFyZXovRGVza3RvcC9oeXBlcmNsaWNrL2xpYi9TdWdnZXN0aW9uTGlzdC5qcyIsInNvdXJjZXNDb250ZW50IjpbIid1c2UgYmFiZWwnO1xuLyogQGZsb3cgKi9cblxuLypcbiAqIENvcHlyaWdodCAoYykgMjAxNS1wcmVzZW50LCBGYWNlYm9vaywgSW5jLlxuICogQWxsIHJpZ2h0cyByZXNlcnZlZC5cbiAqXG4gKiBUaGlzIHNvdXJjZSBjb2RlIGlzIGxpY2Vuc2VkIHVuZGVyIHRoZSBsaWNlbnNlIGZvdW5kIGluIHRoZSBMSUNFTlNFIGZpbGUgaW5cbiAqIHRoZSByb290IGRpcmVjdG9yeSBvZiB0aGlzIHNvdXJjZSB0cmVlLlxuICovXG5cbmltcG9ydCB0eXBlIHtIeXBlcmNsaWNrU3VnZ2VzdGlvbn0gZnJvbSAnLi90eXBlcyc7XG5cbmltcG9ydCBpbnZhcmlhbnQgZnJvbSAnYXNzZXJ0JztcblxuZXhwb3J0IGRlZmF1bHQgY2xhc3MgU3VnZ2VzdGlvbkxpc3Qge1xuICBfdGV4dEVkaXRvcjogYXRvbSRUZXh0RWRpdG9yO1xuICBfc3VnZ2VzdGlvbjogSHlwZXJjbGlja1N1Z2dlc3Rpb247XG4gIF9zdWdnZXN0aW9uTWFya2VyOiA/YXRvbSRNYXJrZXI7XG4gIF9vdmVybGF5RGVjb3JhdGlvbjogP2F0b20kRGVjb3JhdGlvbjtcblxuICBzaG93KHRleHRFZGl0b3I6IGF0b20kVGV4dEVkaXRvciwgc3VnZ2VzdGlvbjogSHlwZXJjbGlja1N1Z2dlc3Rpb24pOiB2b2lkIHtcbiAgICBpZiAoIXRleHRFZGl0b3IgfHwgIXN1Z2dlc3Rpb24pIHtcbiAgICAgIHJldHVybjtcbiAgICB9XG5cbiAgICB0aGlzLl90ZXh0RWRpdG9yID0gdGV4dEVkaXRvcjtcbiAgICB0aGlzLl9zdWdnZXN0aW9uID0gc3VnZ2VzdGlvbjtcblxuICAgIHRoaXMuaGlkZSgpO1xuXG4gICAgY29uc3Qge3JhbmdlfSA9IHN1Z2dlc3Rpb247XG4gICAgaW52YXJpYW50KHJhbmdlKTtcbiAgICBjb25zdCB7c3RhcnQ6IHBvc2l0aW9ufSA9IEFycmF5LmlzQXJyYXkocmFuZ2UpID8gcmFuZ2VbMF0gOiByYW5nZTtcbiAgICB0aGlzLl9zdWdnZXN0aW9uTWFya2VyID0gdGV4dEVkaXRvci5tYXJrQnVmZmVyUG9zaXRpb24ocG9zaXRpb24pO1xuICAgIGlmICh0aGlzLl9zdWdnZXN0aW9uTWFya2VyKSB7XG4gICAgICB0aGlzLl9vdmVybGF5RGVjb3JhdGlvbiA9IHRleHRFZGl0b3IuZGVjb3JhdGVNYXJrZXIodGhpcy5fc3VnZ2VzdGlvbk1hcmtlciwge1xuICAgICAgICB0eXBlOiAnb3ZlcmxheScsXG4gICAgICAgIGl0ZW06IHRoaXMsXG4gICAgICB9KTtcbiAgICB9XG4gIH1cblxuICBoaWRlKCkge1xuICAgIC8vICRGbG93Rml4TWUgbWV0aG9kIG92ZXJyaWRlIG5vdCB3b3JraW5nIHdpdGggYHRoaXNgLlxuICAgIGF0b20udmlld3MuZ2V0Vmlldyh0aGlzKS5kaXNwb3NlKCk7XG4gICAgaWYgKHRoaXMuX3N1Z2dlc3Rpb25NYXJrZXIpIHtcbiAgICAgIHRoaXMuX3N1Z2dlc3Rpb25NYXJrZXIuZGVzdHJveSgpO1xuICAgIH0gZWxzZSBpZiAodGhpcy5fb3ZlcmxheURlY29yYXRpb24pIHtcbiAgICAgIHRoaXMuX292ZXJsYXlEZWNvcmF0aW9uLmRlc3Ryb3koKTtcbiAgICB9XG4gICAgdGhpcy5fc3VnZ2VzdGlvbk1hcmtlciA9IHVuZGVmaW5lZDtcbiAgICB0aGlzLl9vdmVybGF5RGVjb3JhdGlvbiA9IHVuZGVmaW5lZDtcbiAgfVxuXG4gIGdldFRleHRFZGl0b3IoKTogP1RleHRFZGl0b3Ige1xuICAgIHJldHVybiB0aGlzLl90ZXh0RWRpdG9yO1xuICB9XG5cbiAgZ2V0U3VnZ2VzdGlvbigpOiA/SHlwZXJjbGlja1N1Z2dlc3Rpb24ge1xuICAgIHJldHVybiB0aGlzLl9zdWdnZXN0aW9uO1xuICB9XG59XG4iXX0=