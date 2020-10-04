Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBOVX5D5QKGQEM4XMBUA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x238.google.com (mail-lj1-x238.google.com [IPv6:2a00:1450:4864:20::238])
	by mail.lfdr.de (Postfix) with ESMTPS id C6104282CB0
	for <lists+jailhouse-dev@lfdr.de>; Sun,  4 Oct 2020 21:00:11 +0200 (CEST)
Received: by mail-lj1-x238.google.com with SMTP id b8sf273021ljk.20
        for <lists+jailhouse-dev@lfdr.de>; Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1601838011; cv=pass;
        d=google.com; s=arc-20160816;
        b=fW3Gp4IxWjPwo1ZBc3ECxLJtnAy8SkWrcqjby8pOiMZV2dHgnxJ0Xp9YJeJoX9uI/B
         ehGT61+KKaU+7yaSQXtrQ5Sb5lhb5Yfs0gtUHhCbrJx0TfFp725lhKsrTlV7CQsM0Bvg
         58DyHe68MMWT/h05/0gOUQJ+v6xK78fPxEhWCHOInUgelYimzyrZM5mlRK2vPIjN101c
         h8NOeydTzboWr6qRrCxVWT5AM7cuEdepk4/juwU31MTEt9l80BI3nCCvWmlhPoQ5LZIT
         zcNyzGdT9E8IROPiEQphTBLGG/datJ8lR30pyRl8k1N+dyLJFwIgyP5Q0s6TfQYsKh+e
         YOyw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=JXvU6kdFQAWrxQ9bmW02CKPrChI6k4xcmS3TQwezyOc=;
        b=hBIIrbce+E7+e2pzG735EN3Qd6iGGZyrhg0HgFdq2m9d1J9nIVDsEd2XBlWZ3kaAsq
         BCxgRdxZ4lsL+xbdoCKOK7W0i/jYHEEm7w6UGoFIkvSPRCvnr/ozGLPK9foOPPZX31ov
         7lO+vEpHnnTFPmUoyV1SBs+1HKBHJIF+FBZomss3CbSOftks63kCS0gxkL1D+FXxrM47
         oIackaHuhxhUv0c3P6c0+K09b/puNt/ek9aconPsUmKbO0WxD0RAlA3i3b1HK8pdNxE1
         7yOo5rjvgOcffZvvtv/DLuczEPHUATlLacwk+dD08ILKUY9AysG3I4qf64S65Zie/aOC
         XhZg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JXvU6kdFQAWrxQ9bmW02CKPrChI6k4xcmS3TQwezyOc=;
        b=s2qODV0PKhuAO5vYt5OOQ5EhUCEbtlU9NSzwMLrS/fy4m0P/I80RwGIRBACxNXzCcU
         3DHfsonHPiJKVvc1KB4LoU9/Ln2qAJ7qkPtX3UQvZ5ENpsnCAriPrAQ+6Tn/Z4CTibbd
         Q9n3UEPj5QYYSNawm65UjAkjp/t8PgK7jqt1wliz7N6dJEfUCwaRvjecdleI3bnmSWSb
         5dk1jX0dIFijRK8b6EdgSKo9P4WPOtM58S9K3tjJveVoUURSYbKN2h8Se3CXrr2gxP4/
         dmay9EMzCANZpLcaD0B6YkozRPnBDvuiyfU1Lil2jsLl6qDC8Kz28svW9wumMLwgpC4J
         xozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=JXvU6kdFQAWrxQ9bmW02CKPrChI6k4xcmS3TQwezyOc=;
        b=s8KKlijDTXZeY3MfwrAVm/BmuqYXqTMMrr4lDOkZja7SKQkHz8NxUeXqKkH0phUeqt
         uENNuOO0FuaiPl+F8BfgF4Gb9XZafAueuHo3GaXlLSqV9wUZMjdrZSLf0VQcBwU3zQM1
         oeU62YEpzS1SR9bcBTbq1WFbn/PVBtn+kN0gevgeWT3AgEBjLYhCBtyUFWG4dPOZNmni
         hRNUVvpBwuBg9w5Vr1J5/aCMciBQQIbr3gYhBoQOcIp19M7zxpYPbiozWd3hhZ/B7cGw
         chhWsfyiwaN4c0zYlvW1/WScrTSWg+AVh9tFpkRDMH8q/5A99qX0S7s7UjdhPmVBSmVC
         FGhg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530UWPueltGWfoUjXUWQ80bhhjdkmc++ZuGoYXyzH++WdiDznw9v
	hWVxTuX9gzcx38NInUZq/oo=
X-Google-Smtp-Source: ABdhPJzKRIbl9fFrZqZsuIcu/Ivm0vBrKKq/X+BJGE4odKbk9V/EJ6fI5IL3JdlsOMTTohXH368a4w==
X-Received: by 2002:a2e:700b:: with SMTP id l11mr1749580ljc.334.1601838011330;
        Sun, 04 Oct 2020 12:00:11 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:544e:: with SMTP id d14ls1116173lfn.2.gmail; Sun, 04 Oct
 2020 12:00:10 -0700 (PDT)
X-Received: by 2002:a19:4b44:: with SMTP id y65mr2612440lfa.189.1601838010017;
        Sun, 04 Oct 2020 12:00:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601838010; cv=none;
        d=google.com; s=arc-20160816;
        b=OsFbS8lSpJ78snncXKvC7NndjLIehavhMLvNPjryZy3W1KiP5n8/1LFcmkgedD1Z/o
         2yQmv+SKOnrq5W6m4W8qgTBKhkzALAV/x+1H+gR7KdHSISbQ0ce9TQy86IDP5ACf7eRi
         A4L35d3UAfEKeLPf5hlSafBWO19QlF3NhDBqdNanIiXDTKjRB9xC17aRdY2U1DdyIaW7
         vJ2jrpwVWZOm1W7q+QP8vRjRfcIwqxuw6uaBh23idQUUiAR5DzHhAQpM8VuYN7dk4zfq
         jZoItmKm4eJ9fH8ojkLO+waJogoyDFW7bVtW9NdWSIbH7l6uJBXR0839CIB9fOFcpqWl
         WgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from;
        bh=7oi4DfdqKhxYmfbJxoDUiWIVZOzaECmzMQpBumQkzQk=;
        b=nVleA+pX1HNCwhgxtI3j9PR7UruFpBjip6XppRSS+WJMMMSraFA/cBwayIG7Dhkpg6
         MO/4ttrnG3WzRO9xrbRJZqTSqmMC1SFaOqYmRwlYCPIpP4zregV6//N8F3Hzm9sf4keX
         H2NRwHgmWPVU20mfK2bWeb30PMNrPDYUy0YgePFXsFH63vfOY61XxgkVE34HpqLT+hld
         xuxC7M3SnLX5sMWr+K54u7yB6eBFpFfTXkMggmiYSMqQY5bOFitj8QiO4upeei5mqfNg
         CQCE/K0NkX1R8CQzetOimMMTCRWqJt2eNp2TvQmXNpjBKW/xk8RAlQmjRMVqjmIu2jHs
         ckgw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id r7si20950ljc.7.2020.10.04.12.00.09
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 04 Oct 2020 12:00:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 094J09Y7025025
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
Received: from md1f2u6c.ad001.siemens.net ([167.87.242.108])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 094J060I017503
	for <jailhouse-dev@googlegroups.com>; Sun, 4 Oct 2020 21:00:09 +0200
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH 06/45] arm64: smmu: Drop useless features initialization
Date: Sun,  4 Oct 2020 20:59:27 +0200
Message-Id: <d5a0cd560e099f8bd6dfe0ec3006614ac4903fa2.1601838005.git.jan.kiszka@siemens.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601838005.git.jan.kiszka@siemens.com>
References: <cover.1601838005.git.jan.kiszka@siemens.com>
MIME-Version: 1.0
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Content-Type: text/plain; charset="UTF-8"
Precedence: list
Mailing-list: list jailhouse-dev@googlegroups.com; contact jailhouse-dev+owners@googlegroups.com
List-ID: <jailhouse-dev.googlegroups.com>
X-Spam-Checked-In-Group: jailhouse-dev@googlegroups.com
X-Google-Group-Id: 175645748590
List-Post: <https://groups.google.com/group/jailhouse-dev/post>, <mailto:jailhouse-dev@googlegroups.com>
List-Help: <https://groups.google.com/support/>, <mailto:jailhouse-dev+help@googlegroups.com>
List-Archive: <https://groups.google.com/group/jailhouse-dev
List-Subscribe: <https://groups.google.com/group/jailhouse-dev/subscribe>, <mailto:jailhouse-dev+subscribe@googlegroups.com>
List-Unsubscribe: <mailto:googlegroups-manage+175645748590+unsubscribe@googlegroups.com>,
 <https://groups.google.com/group/jailhouse-dev/subscribe>

From: Jan Kiszka <jan.kiszka@siemens.com>

This field already comes zero-initialized.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/arm64/smmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hypervisor/arch/arm64/smmu.c b/hypervisor/arch/arm64/smmu.c
index b3facb8b..59cc8a78 100644
--- a/hypervisor/arch/arm64/smmu.c
+++ b/hypervisor/arch/arm64/smmu.c
@@ -939,7 +939,6 @@ static int arm_smmu_init(void)
 
 		num++;
 
-		smmu_device[i].features &= ~ARM_SMMU_FEAT_COHERENT_WALK;
 		smmu_device[i].arm_sid_mask = iommu->arm_mmu500.sid_mask;
 
 		smmu_device[i].base = paging_map_device(iommu->base,
-- 
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/d5a0cd560e099f8bd6dfe0ec3006614ac4903fa2.1601838005.git.jan.kiszka%40siemens.com.
