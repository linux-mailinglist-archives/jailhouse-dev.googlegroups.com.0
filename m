Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBOFM7D3AKGQEF5ITWTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73b.google.com (mail-qk1-x73b.google.com [IPv6:2607:f8b0:4864:20::73b])
	by mail.lfdr.de (Postfix) with ESMTPS id B38FB1F16DE
	for <lists+jailhouse-dev@lfdr.de>; Mon,  8 Jun 2020 12:43:05 +0200 (CEST)
Received: by mail-qk1-x73b.google.com with SMTP id l6sf13948138qkk.14
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jun 2020 03:43:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591612984; cv=pass;
        d=google.com; s=arc-20160816;
        b=eX2qcHQcWh9vYJe8UlAjCBjyczZ5xZ35KBo+nSrsslnfcIGF7b0vkpZf9bABp10zgD
         ZNqOebizR8OXS27sA1vGUZ6GAZ6paAIaFVwIcCfwJadu3JQMbII0E+4GOYxIYG6Au4II
         PfJXg26FPs//it0JFcphdRH9PymxSt/tT7GFsPRgvIrckhKwjg/c1eSwLaBYN46TFpx2
         PM3fz4dYeH9M7JE/6F0/LaVZN33x2cbB6JFGbcf2sGizHyCrR2oekAVJ8Ait5I5oCKQu
         hEjYkKnp5DFmFUhhpLHmwvDtu4iXuTxbQ09BwdLDpn1PUZCSG4fgr6m9AjiFAJu+XuJY
         SzPQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=O/sTk0xDMBK/i4qXTZv9dvwEAgd/92FxCv0n/dVgU/E=;
        b=BjwiYcGJx9YNfwYiBzPnNLlAU9P1KWb3pFXWbWudGN/xCrBMDoCPolRJBS+nUvOoPT
         LVLSI2ltk407z+2U95D7H3qrVl694leDj9E+ji2FTFoLx5RO82Zxor713HO5EKmu2IY7
         5p8SaqRjW5i++wc/IA/qp1ZYLbV2sj7YUHqLP/ELvUdroXey8K1G70u/PLD+xTIBy+Gt
         ZhUjdrCjFMCHnde+n8O/zaHydKN99U+hqOH8wii7kDOzPiIvHuscSFeDol8XZ4aA2HwR
         CZK2Cm80GWLtJ4FygeCfZPZAkT1BOz91jntOJhSQ0+G5JtlizfQz/mbplQ6TH8pUBnof
         2Oyg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XkGvaK+E;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=O/sTk0xDMBK/i4qXTZv9dvwEAgd/92FxCv0n/dVgU/E=;
        b=dDINx7lcTubtLLSSTQcv/gIdkBguFtIkx2hXhO3dHkCFuxMutYvbSiuI/3EoddMvbG
         dhTCQOE4t3iHYQLrgonmGhTI+79zZJAjK85RzNvjnU0OB6mmB4hnmR1mntKZ+MZSO6CC
         7LxzmOgA4rQ7vKdAgqCZ/+rJa6Y88CycWCjH7qfRX5gz3gQvkehtsHC8MncHvJJdlxtv
         x00EPdm2Vtd70N9insK8FQUFyTx1JSypjqVdklHF2UicifaiTCk1VC1rn6j5G0jebK5S
         yJ+JcwqGrVWsv10y++y+PLIOEqHN96BJ4uPAtrd9JQl3u+T1bfemJ0kQynecSAJsBfEG
         UCeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=O/sTk0xDMBK/i4qXTZv9dvwEAgd/92FxCv0n/dVgU/E=;
        b=nA9DuG3cVpG0NndjRgBbJ+TB/mIEe6wVJrw7Tp1tJtDUO1nGGEmPgxfuQrCkOlWeXS
         7mmB33imaCiR1ulsvwZmbxWEfdeCyMzJdGZBUXzfUGg6EaS5EXKUYAo0HNbst40mwSrT
         9fYhtphVp++x+okeHPhACyrditWmqRB4BZZAfNsYMxD+uMzHhs6s75SrdjEHNysimh5j
         jGoM0Dj2KpssN5FLFVER9savbuwkDTycNNlkYiLwXcAbO3Ft+7qqC0RD19RJlue49jBK
         4+fw+0LCNcJteUqLY8tSKC1nlbhMfD0mK87jIILPnV2wniI8c437f+Im4wNgDhcxgzmy
         GYjw==
X-Gm-Message-State: AOAM532zPkEcnJDV+cZRiHCXSsmgREiCDdH+/ZFPB/UF1TLFQiC3L9BK
	iA8DCVGrNnoUTLGgwkf0mVU=
X-Google-Smtp-Source: ABdhPJwdwsLnMqj4B3+g+5lJBU/74SvX0a3HNpWm4UjlbIM0YMPsLxFBXjeF38CTHaPduF7wju9Ofw==
X-Received: by 2002:a37:b501:: with SMTP id e1mr21417345qkf.269.1591612984781;
        Mon, 08 Jun 2020 03:43:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a37:a914:: with SMTP id s20ls7781452qke.10.gmail; Mon, 08
 Jun 2020 03:43:04 -0700 (PDT)
X-Received: by 2002:a37:650:: with SMTP id 77mr22720042qkg.369.1591612984389;
        Mon, 08 Jun 2020 03:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591612984; cv=none;
        d=google.com; s=arc-20160816;
        b=MpjiJkLOlQC0ZJbQNMM7hBKI4kvp86M3DgeSAQ+LbxMOKpmOO7n2hXXyLbcP+QZbn+
         0miSY6AfxCw9xlBVoILFqLnePvfoEhd6EfOQYCxHch8rNWAC0Mq5wZZNZzWPLnICDmKB
         NOVjPXRk46+atJ2OUkcoUWkf1ux/W+wu/rsrLveIhuTXntC2J6oIkOIDyUFe89qwrJTK
         h837HZQotP1YlXb8P7xtu3I3Oh619pEESkdsbrL6bM1AeOEU9atr1EzKJqpuOI4ESCS9
         Ko4USrOIkg6WwQfMPAllfcSzxKomDerTVufkVxu3DIFjN780OB9jRRN878fcLK6eYG7T
         ZfAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=qA7DqMDYjwu7muCebCNIDKC2SqPu2MNld5kovMg18MQ=;
        b=ON6+/KKzhp+0o/qw8DKFHL+KP1vZDfE/wWDHi0b/keUeNGTiFKWGDq8ymzVsuJC1P7
         SoRQ1Y+dEIHgZtVS92J26dEpLmxZj4RfN5rtAjnhMGwtFE5AKNgDDIHSHtVMx/xenkeG
         Zc5ikpFpmPbORTlq+UNVoBd9uXUWibztQ3mHWZM/7isi0D4qB+9Mlazl8+nW/29MsMwS
         ybgsHRuxSH0hyawaDyWU3OyHvCjwSKy/yWRisoJqmdLdCBmt2NPBNvFvO3l5G2oCXruP
         78dnW0MpdRAtIjIYlZx6ASekbLFVFvDMk7IJloJwxFC8kv2OhHprrgJid4yJlH69YQ0W
         OrIw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=XkGvaK+E;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id b1si390092qte.1.2020.06.08.03.43.03
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jun 2020 03:43:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 058Ah2Cr119856;
	Mon, 8 Jun 2020 05:43:02 -0500
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 058Ah214008580
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 8 Jun 2020 05:43:02 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 8 Jun
 2020 05:43:01 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 8 Jun 2020 05:43:01 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 058Aguh3012229;
	Mon, 8 Jun 2020 05:43:00 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v2 2/9] driver: pci: Use page size to set the aperture size
Date: Mon, 8 Jun 2020 16:12:48 +0530
Message-ID: <20200608104255.18358-3-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200608104255.18358-1-nikhil.nd@ti.com>
References: <20200608104255.18358-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=XkGvaK+E;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: <nikhil.nd@ti.com>
Reply-To: <nikhil.nd@ti.com>
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

From: Nikhil Devshatwar <nikhil.nd@ti.com>

PCIe host controller is added by jailhouse kernel module via
an overlay. The aperture size is currently set to 2 pages
assumking 4kb page size.

Update to use the PAGE_SIZE macro so as to work with kernels
where page size is configured for 64kb.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 driver/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/driver/pci.c b/driver/pci.c
index 601e2d96..c9f07780 100644
--- a/driver/pci.c
+++ b/driver/pci.c
@@ -439,7 +439,7 @@ static bool create_vpci_of_overlay(struct jailhouse_system *config)
 		*prop_val++ = cpu_to_be32(base_addr >> 32);
 	*prop_val++ = cpu_to_be32(base_addr);
 	*prop_val++ = 0;
-	*prop_val = cpu_to_be32(count_ivshmem_devices(root_cell) * 0x2000);
+	*prop_val = cpu_to_be32(count_ivshmem_devices(root_cell) * 2 * PAGE_SIZE);
 
 	if (of_changeset_add_property(&overlay_changeset, vpci_node, prop) < 0)
 		goto out;
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200608104255.18358-3-nikhil.nd%40ti.com.
