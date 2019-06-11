Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLHD77TQKGQE7KEXW3I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 364383D56A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 20:23:41 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id p3sf1900319ljp.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 11:23:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560277420; cv=pass;
        d=google.com; s=arc-20160816;
        b=lbUPFzXDrnMoqVJK8r7vFxpQGkHkCW2fPLbiPQ/CLYkABgIJh74k1zhcgyiosLTuM6
         eJe57JY0omZ01KJU//wsT2zncPaauGT8iYHNFTNNVyhoUhgYIcG46bKMqY6K4LXU2FDi
         sHMjGEmet+Cp5A2dlMyYa2awOl05v3WtnFhKmPsINIjE2QD7AUR23XMja1a9A2ZKQKBC
         5MmkgR/xOr9+WBZgJ4NcJa41SIKpjxhZFf6wfRIVlle6LRoPNqYU2522gKFlLsdyIIWB
         x/jv5Kj4lHmm1ajyun9PrDN8doSmUaQJFs33efNIsym73fUzdPOZxtnfS7YakhImM4zY
         tjfQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:mime-version
         :user-agent:date:message-id:subject:from:to:sender:dkim-signature;
        bh=UF8y5of7BPWWME/vSeTl/n4V1Z3cAWO3qTaOaRDlFYM=;
        b=tqZhjI/lqrze5tMLvqO2m5aaCNTiL9Vb04p9hIosJSRMF5Q9xizM8PqP7IND9v1PDG
         srO7vE9GFwH4cGPMyhhW5s4cf5ulbabV294Ux+Oqu0L940fsua/xnLcpUYhbNm2XByY7
         cxpW0JfzydIUmDPSP9pLXGY/dzfKBddPrC8jRqY4wD0zjbZy8aUnQrgFLhGbEiImuq44
         T9lf502ZdlZ6qEYa7BAqa0jpwZ2XUy8uvgOeqr/jYxGUEcKoywhGpWqw3Nm3ur0iE9vY
         +57rvfzWI1a0+ZHAOjg8CoAIQrOT5a1IC6nBqyBOAXmPRuH8pESd1ZDYeAoBaL0Wr8k1
         ZciA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VUNQxzkW;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:to:from:subject:message-id:date:user-agent:mime-version
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=UF8y5of7BPWWME/vSeTl/n4V1Z3cAWO3qTaOaRDlFYM=;
        b=E/YBLRpnQuLXhymWEw0Qezjdg52DypYwq4moD6ChXuxTtC2wH+7h7Uw2a/umyAtfyu
         Tm/YRBxfM7yFVCTnubkeVWs5B5p1HNlRaH0N9Hrgm6SCVVxD8zJwq+2hEDc5PDRTA2fN
         LzZABSA8VB9+SiWNQufdRK6IgLOLNsAkCONL3LScBb/yhJkRBSGPWl0S1FKjO8GF1lk+
         +5+fN8TvJNuv6uHFsqweYh+b1ypxcAT0niCA7DaedDgyExR5GBqzK0njnLPNv1W+hrLp
         9BLU6n1gPm5cBpwSopytUvO5TeNcsmkGhIhsvaOcDe5q6hOIja86cXKeSPfZCz2DxXpZ
         v5rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:to:from:subject:message-id:date
         :user-agent:mime-version:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=UF8y5of7BPWWME/vSeTl/n4V1Z3cAWO3qTaOaRDlFYM=;
        b=F/YPuwAHpWLnK2id5XqY+sHoyOJ0rWp67subK70OwFUI5pRIhVLKUK2/66enRnnxZB
         ewmBPT/GPsBzyIdpIZXzukTzU8atj2sTWkU7HaTHdts0ftjrEP8gf0kPedptwaHsOYJy
         vzwelLFJm2DVRYE+0QSfnTdBKmBc1zh0bZ0Cw7wZAK4a1PmZJ2164/BtpUeqXyv9nj9C
         9GSR7qjL3zYw8TIvayEAGZedBUngQjh/cpx2qEKajkAriAVKv9j/wwTADc2O+RfSAIPS
         an+JEXTDLWvqhYlOX/kGjD8yHLrd9MWNU477fi2Xkq7wj91AYBob2nkLq6WVY5JY0P84
         eXww==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAV2RssfOp7tbOswCTYAb/H3nznsil5Vq+3MpUq9RDVwUg6PgLZN
	qZCOSIkR9SYjU6D03H2v7+0=
X-Google-Smtp-Source: APXvYqwZUvIWch+DW+PGviuqP9ddc/IgCz3JPxavQemO1PcWuwijKce457IZsWKG07xppOJyxdfM8g==
X-Received: by 2002:ac2:5467:: with SMTP id e7mr15098015lfn.23.1560277420784;
        Tue, 11 Jun 2019 11:23:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:8198:: with SMTP id e24ls885773ljg.15.gmail; Tue, 11 Jun
 2019 11:23:40 -0700 (PDT)
X-Received: by 2002:a2e:8847:: with SMTP id z7mr11212766ljj.193.1560277420263;
        Tue, 11 Jun 2019 11:23:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560277420; cv=none;
        d=google.com; s=arc-20160816;
        b=KGTcvDt5ls/ZKxK0sBttgkUH1eVWGWRfCTh6vvDWnlwSesA1c4DJwlp/OMMxn01lxt
         qqt42XNJmKgb6OaOU/DB5kkoE0DuXD1Cq4RBleykioWnPEHUgKAsYWemzO1cI3ZBjrr0
         NKGN05N5eSv9pd6/PAdQyH35NVNz6v52uPctVVg0YXvO19N+aVBaAcLdQIWiIo+AI+kN
         GYsKXxYF43+ifQs5KKd+GiaQlOlg0iBHLgaFVQ/ExZd3glqQMTxzCDpz3VqvKUER3lMc
         CXWcwn0JluPR/B8vymI2CFAEk4PYfT1yTlA4+S92OFt4MhwkeZWc10a1YH6jVDISLgKG
         5JKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:mime-version:user-agent
         :date:message-id:subject:from:to:dkim-signature;
        bh=tqxoicvbtgtUcrBt0uq8wFQVLAAOii4soRIC4FPKOao=;
        b=d+cZSbO36vm3G6TYCQA24U3gtNipKaUfLUXzNY3RYHhrzzUbPIkUEm8FpAVTNzTw0j
         GZozCKLILwlUrMLwp8GERHPoKqPbRXrdUV0UDbaBcmpkyOEFds+0yInwFx5Jdj2j/Dwu
         o5m4bl9O3IYSiB9/XenbOKrecyNphc9Kn5O0kZecC9PpYnv88D4BRdfjNXnQ+47RVfTD
         2IjSqJ6Z+Ty9hj+3vKU4C2E9vm4u2KffzHzIH6+rRNXQO8Ry+Xz8QOeNM//sz5sIoztw
         ooFWqhmzleJX76KK16eRHFc+S517QcLGojxi0N2akiMpOdSCX+Pzl3Up8URCV4IdfGgg
         KLRg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=VUNQxzkW;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id l7si116385lfh.4.2019.06.11.11.23.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 11:23:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.18.208.3] ([46.183.103.8]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LcDJt-1grDrh11NN-00jWVn for
 <jailhouse-dev@googlegroups.com>; Tue, 11 Jun 2019 20:23:39 +0200
To: Jailhouse <jailhouse-dev@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Subject: [PATCH] x86: Clarify why we call arch_ivshmem_update_msix on
 vtd_emulate_inv_int
Message-ID: <e55d0852-e971-87e0-c458-810f525f1013@web.de>
Date: Tue, 11 Jun 2019 20:23:33 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:o4KDBQd6UNX3ovyuesNvINKsuc1b865Jf8Fj3lxMfRi5D1Tk2F/
 gzhe3G5UvbZSFYv7kLD1c6TSzs6N36z13xGkp9IEyYgkvbPY1D4VLHi0B8pDcDqlgtpTsPO
 i+2kgldYKsP1W6JGWw8lukqMy8IET0fOSw22sy+FEq4jkD1QQHWpYuzYVg0VrbtJ9PdAFje
 Ov5FzuRsGd4/v5Sk1RFpg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kJ+E4DPdVYY=:RwfFCYUj2d2jeyoC0NWZQ6
 ccY7EWHKxphKU2PeeYo4hq7mkTeY67OOr5vcbx6YbAHac9aVWe0gpO4D0qXh3OuUI6nx3GzBn
 aS/XhNm9WZTynLGkLuLaNUWa7lr5ofIkQQyATR+n5vvIMmcGERyZRKXtqs0Cxc0J/WJKa8kAg
 T/104S2Nj22Viu/WSckIYdifqiteaaxldN+7sZLRGe5ULfXomRpO07yTA85AJ0YPtyN7MLm1T
 /InXZSYcYc2pEPjMtJWjUaaHAzSBU9xPnKFin183Lt5Ua+/X6u24w39sD8FI4dQxwjVf3oB8C
 eF5R6yzCB5gfx+mfdFkXYH03VDGoNLD2KhiCbGzolso12WXrSPjvSdJxiqmmXQK9SO5cxa2Ga
 sbFYnRfHLTWluTk3wKPXjiyWmYc5ley50tB13XmBAM623vWTUDMu0FYX9LueMaWFG6K/kI6PY
 N23zyzum33inGIipC0Iot4wkuBEvcue1wOh+yRXC7IJoQGeWE8ruqCOKY8SKdUGT+We5hw84M
 BUNWoxhq7+Gory7azzW7/uUK87+Y15JpJPB4Nme0yjMAtAFN9Dks+4VpiAIEiELOBm1Up8RWL
 wkEiX+z1psZKiVPpqwsCfuoep5gMZWAG1Qsk73EQLZDd2TSw2YbFWBiMoUFVutf2ut9CfpPQj
 iHCG/3CuWyEBC1CwE13NZEyQRkJpXtWBfHm++QNCNpqoBbvktOnEG4lD78cy/ei86IrjcwHAb
 CuzqOW/k81nGFe0VA4Am9bnJjKpzk4dyPhExHZ/kFRdMhMQS+YrE5nuhTLYW/n9DyztKCeEml
 0td/DS/Bq2CNsB/dlD5BdTYfdFJhZ2dl6qYUF/JeZkkeEjAPZa1v4Kcld+MHcboT2TnbCQQpv
 M/aqdn71YMeDv6NJDbkHjgdaz+TIyzKl6G6+dg2W9nrjobOfMKPD92XhUD4HU/RW6WW2NO1fF
 FodCqenubsX0XGBdhSMfnRV//ZplZet4/txc6vLsJdoJH5xjDl0mw
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=VUNQxzkW;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

No functional change, just documenting the possibly non-obvious.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hypervisor/arch/x86/vtd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hypervisor/arch/x86/vtd.c b/hypervisor/arch/x86/vtd.c
index a43632f5..1cae0dcb 100644
--- a/hypervisor/arch/x86/vtd.c
+++ b/hypervisor/arch/x86/vtd.c
@@ -398,6 +398,7 @@ static int vtd_emulate_inv_int(unsigned int unit_no, unsigned int index)
 		return 0;

 	device = pci_get_assigned_device(&root_cell, irte_usage->device_id);
+	/* On x86, ivshmem devices only support MSI-X. */
 	if (device && device->info->type == JAILHOUSE_PCI_TYPE_IVSHMEM)
 		return arch_ivshmem_update_msix(device);

--
2.16.4

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e55d0852-e971-87e0-c458-810f525f1013%40web.de.
For more options, visit https://groups.google.com/d/optout.
