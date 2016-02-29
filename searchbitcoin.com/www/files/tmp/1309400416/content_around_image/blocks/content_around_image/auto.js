function ccmValidateBlockForm() {
    // note: we need to append -fm-value to the id: see helpers/concrete/asset_library.php
    if ($('#ccm-b-image-fm-value').val() == '0') {
        ccm_addError(ccm_t('image-required'));
    }
    return false;
}