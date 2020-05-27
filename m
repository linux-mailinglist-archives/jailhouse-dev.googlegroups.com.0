Return-Path: <jailhouse-dev+bncBDL2JD42SEIBBZ5XXH3AKGQEJVJEKEQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pj1-x1037.google.com (mail-pj1-x1037.google.com [IPv6:2607:f8b0:4864:20::1037])
	by mail.lfdr.de (Postfix) with ESMTPS id 92EDE1E41FE
	for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 14:24:09 +0200 (CEST)
Received: by mail-pj1-x1037.google.com with SMTP id mt16sf2423807pjb.5
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 05:24:09 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590582248; cv=pass;
        d=google.com; s=arc-20160816;
        b=afUh9xIRSFGlVona19Ek34ixKAM17U8BJJPBVOJlQTozBMxR0CikePWpdDuVEK6x45
         NvIfxvDmYdZPhJaWPQRcy18BqUL8Ui1ZAIHb7I7zyMkXESv60HBE/NrcNkZAwHMW68Wl
         cNT5Ti/3kbviJX6YGcho4bGSdASoQmWnV1YpmfDBq7QVpYWewr1WYQnQlCJFrLeVHUiT
         MB2BMciG9D1chMZgdKreGEFSmdB276kvAVeVVK7YdTrqQ5szJjQO15mCI+ldQ9qgKpnq
         iJjnTlYU38AMzyIcuQa4mYCh5GdFHRVjChHHKW4zK6VKooDTlmBdLY2+sQ0Q0CUijm65
         SRrA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:dkim-signature;
        bh=w8Ew3eh12vXIIWnAC17tlsbZhslkD4yBiNvXg1lCn5M=;
        b=UA+dvM0isRLr01+0ZNFs8PBuj/s9L7wFC51eQpr5YJqsAHx6l+H7TEd2zCb24QpCjw
         gguRZi0+iAODGGN29LTggayuj/89NfoxfWU4pbU1AHULrsfO7Bo69Bx5LMavQd2ZWGWJ
         Wp+sTguM/a6LvwF9yXLkWL4KqUcLlxjDquhmJMsw17Z/d+y6swep3DYKmKDazLutBK+N
         5CwllSpk/REGjRtYjSxyeSTpl6Hq3bkophfXFxsUnUGGhR10ndeLNrlKvrubjkzD67sx
         sHvZ5X7Buh7aSGJTg1PoUgbtnCM4k9RZUeGsg08K5mFFQfrlYvtbqcH//pL70F/JVvry
         lI/Q==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=T963boCR;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :reply-to:precedence:mailing-list:list-id:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=w8Ew3eh12vXIIWnAC17tlsbZhslkD4yBiNvXg1lCn5M=;
        b=RqK3nKEenS89pHXa2Oi4DBTlxp0OjlbPGDNIHFTpAamyAPo+SgjpwtlC7D8r924LsU
         eT1CJ0SLEdf4aA1d8ezVfVkz/AVRteUXWZggEsOUfb//JPG5X4BbxWvUk9F9/MbHhJQR
         LVhFX+KfV5i2CrxrfMqep6LsxHqQ44R1DWexctK7C+6+I1nm4GFg/bn5EBMx1+SycryE
         vignwJmecVMcknrQMMAIyU51gRn/y/0UzKGnj99enMGQ+BBcPHQ+JH5RbBYdlJdue4Bg
         nObdpk3CLNWeuGhnX80Ebi7IFq1WnYf50ynR6DRMZTHjXWbEDmYg3kw1VNNmzoYSzcf+
         zhFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=w8Ew3eh12vXIIWnAC17tlsbZhslkD4yBiNvXg1lCn5M=;
        b=CLKxzkQu5C87gFUfQIp252TCI22hQP9Ol+nNB5On+Fg+98Jhed+j3qrE0BX3hZjTPu
         msLbk1v+rotxkYg/GvoLokKx2qrt7g9K7Q4PYDrYG4wKwjnVlcPBJFTxVUt/APz9if59
         07s/DQyOOu7bspd9YlVpgmDcKaE8QVv6iXDn7a3VzypIu5lzWOg+x1X56V4z6Wh3cl47
         FqAeDrHnz8spuNuBHJrxjru6kb0oN/8OZwPxNlSt8qLnBlr/HFjEsfX0Wm4M2+oK4/jU
         bi65AULnlwfWPuLZ/qlYNM3N3JfZ9DSI97BKVjTdU6giuiD++H4wYacwJJq6Qhf+OSWD
         nNww==
X-Gm-Message-State: AOAM532LQrUqp4F/nex4v9La07iLMPgpHqt8tEtr8jTplK/whjB1lJ0+
	jtolb3/IbkhS4CmDoK795NQ=
X-Google-Smtp-Source: ABdhPJwcoO6g06Emki8zW8N7jEBxxy1AYlIXKz3uMvJmlPOhlnfan/NG+3eG8lJPrdljbNo6bOGbow==
X-Received: by 2002:a17:90a:2586:: with SMTP id k6mr4793388pje.121.1590582248037;
        Wed, 27 May 2020 05:24:08 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a62:1703:: with SMTP id 3ls4958156pfx.8.gmail; Wed, 27 May
 2020 05:24:07 -0700 (PDT)
X-Received: by 2002:a63:d844:: with SMTP id k4mr3798625pgj.141.1590582247323;
        Wed, 27 May 2020 05:24:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590582247; cv=none;
        d=google.com; s=arc-20160816;
        b=ezzuulfqPE/nl3+Y03vqbPZ3PDWeX/S8oxEWer53o8ZP5TknUvs5hZ7L8BaH/BcqVW
         TBkqdxLeOxTrd77YOAxmdLdI7LWfUoD4R63mYBc9u39JXOJg2eVhIgEZYb3Zzc8OxYgL
         rptk6QUgy1GrXg6xY04wERz4vfA7Ge7DqjE5SINddhVPFYDpDKsK8keTNpjzZYkBCKh5
         O/c4HxaE8RE6nzUba3+6RFRDYz/POR/ACMEhHzj8oQ8PWDlf3xderi+0eBniJzdozSdd
         95S0R+D7glouRpLGn6ohXv2wzH0N6bcRXdM9rLJGxImGdyQY66tqUkIcYnuh5NNT6NcH
         EvfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=102jw6uHWzUmxWgzHPc4Hc1Q08uSsP6XmsUixCXgWsE=;
        b=khrmCv3OEY95lm2UW5eX1S80vjUzVv9KvFEuLHmevB31aXs6DPe+UuZJ+gxwADYak/
         DCCRdTlIVe1ss/uiSQM3N0prRVB3icB5meJz4ivqFKLf9c6thA6IoEPbuN/gh05S23MU
         bXSiCRySOaGQxDltZm5sP5i2v8siVoUREXjtP2FXq7MelLxsvK9UcoRbYfFhQdV7BSwU
         lj8e1aZvF+lmum7gVn+Jv97QAKKcHx9jQ9e9nd9MGW4qR7dj2lQVmWYc8YfGQV4RbqzW
         56IV7eXEuva3FCGanzLLYU3fP7kLBddkc5Ysa+X3+Ll3tNNuXdMhzj4sbHKuC1I69JdO
         Hu7w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=T963boCR;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com. [198.47.19.141])
        by gmr-mx.google.com with ESMTPS id q1si170013pgg.5.2020.05.27.05.24.07
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 05:24:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.141 as permitted sender) client-ip=198.47.19.141;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04RCO6qd122653;
	Wed, 27 May 2020 07:24:06 -0500
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04RCO6Ab129861
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 27 May 2020 07:24:06 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 27
 May 2020 07:24:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 27 May 2020 07:24:06 -0500
Received: from NiksLab.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04RCNxM3076356;
	Wed, 27 May 2020 07:24:05 -0500
From: "nikhil.nd via Jailhouse" <jailhouse-dev@googlegroups.com>
To: <jailhouse-dev@googlegroups.com>, <jan.kiszka@siemens.com>
CC: <lokeshvutla@ti.com>
Subject: [PATCH v1 3/5] configs: k3-j721e-evm-linux-demo: Remove unsupported device partitioning
Date: Wed, 27 May 2020 17:53:56 +0530
Message-ID: <20200527122358.14723-4-nikhil.nd@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200527122358.14723-1-nikhil.nd@ti.com>
References: <20200527122358.14723-1-nikhil.nd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=T963boCR;       spf=pass
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

In kernel 5.4, support for following is not available:
* D5520 decoder
* GPU virtualization
* DSS display virtualization
Remove these from cell config.

Without these, when root cell tries to access these regions,
it causes failures due to mismatch in memory mapping.
e.g. All the DSS pipes should be accessible to root cell.

Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
---
 configs/arm64/k3-j721e-evm-linux-demo.c | 65 +------------------------
 1 file changed, 1 insertion(+), 64 deletions(-)

diff --git a/configs/arm64/k3-j721e-evm-linux-demo.c b/configs/arm64/k3-j721e-evm-linux-demo.c
index 4a5aa3d9..cda1614a 100644
--- a/configs/arm64/k3-j721e-evm-linux-demo.c
+++ b/configs/arm64/k3-j721e-evm-linux-demo.c
@@ -24,7 +24,7 @@
 struct {
 	struct jailhouse_cell_desc cell;
 	__u64 cpus[1];
-	struct jailhouse_memory mem_regions[27];
+	struct jailhouse_memory mem_regions[18];
 	struct jailhouse_irqchip irqchips[4];
 	struct jailhouse_pci_device pci_devices[1];
 	__u32 stream_ids[2];
@@ -135,69 +135,6 @@ struct {
 			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
 				JAILHOUSE_MEM_IO,
 		},
-		/* D552 decoder */ {
-			.phys_start = 0x4300000,
-			.virt_start = 0x4300000,
-			.size = 0x100000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* GPU */ {
-			.phys_start = 0x4e20000000,
-			.virt_start = 0x4e20000000,
-			.size = 0x80000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* dss.common_s1 */ {
-			.phys_start = 0x4B00000,
-			.virt_start = 0x4B00000,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* dss.vidl1 */ {
-			.phys_start = 0x4A20000,
-			.virt_start = 0x4A20000,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* dss.ovr1 */ {
-			.phys_start = 0x4A70000,
-			.virt_start = 0x4A70000,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* dss.vp1 */ {
-			.phys_start = 0x4A80000,
-			.virt_start = 0x4A80000,
-			.size = 0x00010000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* serdes 10G */ {
-			.phys_start = 0x05050000,
-			.virt_start = 0x05050000,
-			.size = 0x10000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* DSS_EDP0_V2A_CORE_VP_REGS_AP */ {
-			.phys_start = 0x0A000000,
-			.virt_start = 0x0A000000,
-			.size = 0x31000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
-		/* DSS_EDP0_INTG_CFG_VP */ {
-			.phys_start = 0x04F40000,
-			.virt_start = 0x04F40000,
-			.size = 0x1000,
-			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
-				JAILHOUSE_MEM_IO,
-		},
 		/* linux-loader space */ {
 			.phys_start = 0x89ff00000,
 			.virt_start = 0x0,
-- 
2.17.1

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/20200527122358.14723-4-nikhil.nd%40ti.com.
