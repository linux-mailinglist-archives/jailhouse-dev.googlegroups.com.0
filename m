Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4FXR6NAMGQEXFGYTDI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 064395F9B53
	for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Oct 2022 10:46:42 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id k30-20020adfb35e000000b0022e04708c18sf2498651wrd.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 10 Oct 2022 01:46:42 -0700 (PDT)
ARC-Seal: i=3; a=rsa-sha256; t=1665391601; cv=pass;
        d=google.com; s=arc-20160816;
        b=b8eBx1/gCHs6qsAgQqgvPviGdx17yRBGv1Gq5udBGHNx14uN+H8u/cg08QxqfctdMS
         MSB6h4hMJe2hqO9vGrpRc75r1rkV2hh+WYBsXDzNOBWrMWNqmVdl6/Dv9PN1/Kzt5n+F
         KNZYPespfCsgqL7TyEAftoGdlDYHZtKyzw6GjZjT0neFVbEBri+immp5vSiv/IDvRIXY
         GGE4OOO87yjdGpkw6mjbTQUC2lt9uZuPD7fJ8DfvpMwXx01YQrnMpOdSE90uolTSOLf+
         +8rx2ov32YrfznPgN2hpu2jiEOE/Fvi3BxGrcdTj5oaCJBpwa5pFsuzTrRxjQUHHEFlZ
         faTQ==
ARC-Message-Signature: i=3; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:dkim-signature;
        bh=B91t6gm1sYRoMC1WwFAGbi75tFN2NsC824LcvZr03GI=;
        b=ZZo+nGnHK7hpO8VuLNleQHMvvqKRc+FJcytwR/xUY7aoasj+b8ml8miOU9LRKVsHUo
         OtRUradVNlMFUWmQm7Yh5UVIa+ex2uWsWTtuh5FBTM2bK0isu8u9mczTtLl6BomeIdnl
         SeL785wv5OzVbrLc2zJIuwN8aS2aP6gMrHAVbzOwbBScV6k96P0BgdMhMOtChSEgtXqb
         RPm3kQaS10nqn5q78vgjb/2FQ1OXOag4S1mANAV/Q2vFvFsKIzgYkHXqzw+tSohTRcUq
         8Ill2M0iogXDCHKqtuhYe3JHP6lmD1E/GfVspPKPKaO5ajloRu/UyVD6NNYTyxzeJi10
         bRdQ==
ARC-Authentication-Results: i=3; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ahcKejpz;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.55 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=B91t6gm1sYRoMC1WwFAGbi75tFN2NsC824LcvZr03GI=;
        b=EZKcwgjdQSumOsQCbz0Ouy0rafF6w8f7XJH/kZneIQfPIPJ19knrUO1kRgeTWeEwzk
         UqPjw+86lg+2F4to5aqmZbmHQMZuXynZX9bo7e9UThFJLjKvkYkzI4toMpnjZ8bJjGnu
         ucVASveKxW07z9IhbYDfhYDUIwjNP86o88KKz1gkzGJMWuWfcrO6PTgePwFCFhPFdXdt
         v2Bozjgz6RkeIzyZ5NdlKrXB09nyXva0+Weo7XAxhOa6ieWfb/7jpmEY4syVQ1ghZQ6F
         nyZ0ohDCVxPJIdB/32KJ34jeaMiw/hKiE44ItChdJQqpp33jGSKbgGpaA8j+Fyl/i2pF
         uIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:in-reply-to
         :from:references:cc:to:content-language:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:sender:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B91t6gm1sYRoMC1WwFAGbi75tFN2NsC824LcvZr03GI=;
        b=pWkeBIX0+MwIdVEYd/Ab2nd4uihLaUtK57HLVYjazs9lH74qKspFDPUSWB+R5xSkQK
         SyJ2NLO6SYy+u8W9Qkl90e2Kzv9lazK+a8n8hiCpLTmQIIezZw5haLq0tRJxufto0KuA
         +vRc8+vghl4wrJkfmxr8y/weC24L1sL4tSaU3BxPcqXfzJzfcCLYu2Y8WWpKUcCGSybg
         pvlNYIOyaZLHtM7hgKbkaQAowD5QOdJZgNC4q+WGN8kA1UCx7Sl4apTluE6C9Ku8kJAU
         D3dTHzeuWnox9y8ICKN+d+WuOQSgktOy1jaguYYP7EBm6A6Vb6As1BGWE9kKJPRuAaDs
         Gb9Q==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf1XITRcLZnxHCjWrNAqOwGzDcO2qxqzTXJZXwXa9Z1n7U5QP2vm
	mOoa9jT7PXjmjw8d2eAuqto=
X-Google-Smtp-Source: AMsMyM5NjIibJAG0Yz/KmmhvKZbmy9os/eLUr0AMV3ruL8pOeBY/BKO9EN3fwifPGaWb8MakHCKr6g==
X-Received: by 2002:adf:dc4b:0:b0:230:5fe6:69d2 with SMTP id m11-20020adfdc4b000000b002305fe669d2mr3041088wrj.469.1665391601448;
        Mon, 10 Oct 2022 01:46:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6000:1f0a:b0:225:6559:3374 with SMTP id
 bv10-20020a0560001f0a00b0022565593374ls8953687wrb.2.-pod-prod-gmail; Mon, 10
 Oct 2022 01:46:39 -0700 (PDT)
X-Received: by 2002:a05:6000:112:b0:22e:58ce:40d4 with SMTP id o18-20020a056000011200b0022e58ce40d4mr10880988wrx.193.1665391599467;
        Mon, 10 Oct 2022 01:46:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1665391599; cv=pass;
        d=google.com; s=arc-20160816;
        b=PoiZyo51Y9s3SdYxE12gCogPnO9DvibyoAqcoMX+4YrXcsWWaAc/G7Zds3WApIEYmd
         C6laqP6I1LEOd7VmKgDgeR09EgNl8boZNf1xaJDEqhDYthpKVw0NSdoELWH3K51DxAbM
         DzPEhI16WMEPsrBRt4dEtOpgnhdgdOKbW4uJlV2Bk4qLxBvck5BBDRKzl6wfuXJSL9qF
         THNV5pVI6GVc8Nr4b0V7LHWQhgUYWcVswydRF6fWPUK1Wd5Tq6n9tPAtFTiVngpi6XeK
         x3eokJcmle0HUQeLTZIuMUU1rMMLf/CGAK1CTdqyfiAgnIR9n9PlV0W+RuqR73rEo36v
         uQ9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=M3F4/Mg5QZArYB53vsIqqIhiUrWNKzG4L7HrJ8U7xVU=;
        b=tfjqLyAwTA33XxnS6yToWYXaIXUCSELxOKwhBphdtivp+NShz2EdrmPhmOcla8KaLi
         BaWFGl2ES2sjn1b+bJGIj4US3UdhxIBPDHi2xa+zYM4c64/j6QRBaBnqwuSWC59xitqD
         GHmOKAM3jT7ma8KZo0BZRKksjzvPkh/o8VSWa4R9wKzppVIMvODhrTyYRd49BYwiHiFV
         x6ULhpmRugGvzRV5lEDQDadf/pVzUCpFBKABKmplejfTbCUrIFOCeM5mtwGq72OQSO6Y
         JbxNkSZDIlZJRcIJ8s4qS/IQnkyUSnaIp3B/hLeMZXXE2PODM573YChCFHZmKDB+DHjf
         VY7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@siemens.com header.s=selector2 header.b=ahcKejpz;
       arc=pass (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.55 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2055.outbound.protection.outlook.com. [40.107.20.55])
        by gmr-mx.google.com with ESMTPS id 125-20020a1c1983000000b003a66dd18895si712354wmz.4.2022.10.10.01.46.39
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Oct 2022 01:46:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 40.107.20.55 as permitted sender) client-ip=40.107.20.55;
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OGgTFgLML7ftpomyo1pbBC+6XMwCY0/MeqnrvRvk2SPljdUhH0CXMEvgpHjeTLDfnYNsRJUUTz9DlqSCEEBX40Lc+vnOcglUsC6ySgOp/o702BmPde7p3L901ChJHN48l4Hd0Ai6SkgzJAEF78iOoWoIZptprjwjO13DXjRLDRwpfS/GtAQMRG7SjMD1JrunVc/aLVzcdMq2S8f3/zc8S3GKGic7lFDVjImyN8eUCSv4eBh6cK6ehzI4CCM4sjCdgIgt3uUcBBk3wZc/qyCGrJ9iq0Z4KWyUiMbwgdO5w4G5r3rS7MH/ZRaKAi7hkZmIaEOEPPzFCNN/m2rUv/4/6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M3F4/Mg5QZArYB53vsIqqIhiUrWNKzG4L7HrJ8U7xVU=;
 b=Se1Z4CFSDnTVs0Gf6ea80kNm+07xHCBfFpi2ibHyWuaWqkCrBQ3vtDVHdj0cRhTffFt+aCtn579Tt/zVJOadpfMfE7f/YsejmhbjDgFO+F7Ys7WN3B1bXZrp0fWQ/518ArNbkr0KBXeaVePAlnlZimWP+HhuPU0Gfrxj7EQUgbMcn4OQwyDKQWe5QIlVOAQYQSPC4ayausoYlXg6LRLB0IbgARlhzrXPctQnWbuZQjXKYCdMtMt32S+gpDR8MsxEFFbJjxjPAgWXMLVK0yVF9m6JXbMDJTDoAa124IVh2qTzf49UIwg8Tr22WcPiCln2lhFNeEKeHYaWvowyyijQqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 194.138.21.76) smtp.rcpttodomain=alien8.de smtp.mailfrom=siemens.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=siemens.com;
 dkim=none (message not signed); arc=none
Received: from FR0P281CA0140.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:96::6) by
 DU0PR10MB6108.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:3e4::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5676.19; Mon, 10 Oct 2022 08:46:38 +0000
Received: from VE1EUR01FT048.eop-EUR01.prod.protection.outlook.com
 (2603:10a6:d10:96:cafe::ad) by FR0P281CA0140.outlook.office365.com
 (2603:10a6:d10:96::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5709.15 via Frontend
 Transport; Mon, 10 Oct 2022 08:46:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 194.138.21.76)
 smtp.mailfrom=siemens.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=siemens.com;
Received-SPF: Pass (protection.outlook.com: domain of siemens.com designates
 194.138.21.76 as permitted sender) receiver=protection.outlook.com;
 client-ip=194.138.21.76; helo=hybrid.siemens.com; pr=C
Received: from hybrid.siemens.com (194.138.21.76) by
 VE1EUR01FT048.mail.protection.outlook.com (10.152.3.69) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5709.10 via Frontend Transport; Mon, 10 Oct 2022 08:46:37 +0000
Received: from DEMCHDC89XA.ad011.siemens.net (139.25.226.103) by
 DEMCHDC8VSA.ad011.siemens.net (194.138.21.76) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.12; Mon, 10 Oct 2022 10:46:34 +0200
Received: from [139.25.68.37] (139.25.68.37) by DEMCHDC89XA.ad011.siemens.net
 (139.25.226.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.12; Mon, 10 Oct
 2022 10:46:33 +0200
Message-ID: <c4c35f8a-47ba-5e24-18e7-5190330c7e2c@siemens.com>
Date: Mon, 10 Oct 2022 10:46:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH 1/2] x86: Check return values from early_memremap calls
Content-Language: en-US
To: Borislav Petkov <bp@alien8.de>, Ross Philipson <ross.philipson@oracle.com>
CC: <linux-kernel@vger.kernel.org>, <x86@kernel.org>,
	<dpsmith@apertussolutions.com>, <tglx@linutronix.de>, <mingo@redhat.com>,
	<hpa@zytor.com>, <luto@amacapital.net>, <dave.hansen@linux.intel.com>,
	<kanth.ghatraju@oracle.com>, <trenchboot-devel@googlegroups.com>,
	<jailhouse-dev@googlegroups.com>, <xen-devel@lists.xenproject.org>
References: <1650035401-22855-1-git-send-email-ross.philipson@oracle.com>
 <1650035401-22855-2-git-send-email-ross.philipson@oracle.com>
 <Y0GTUg1ACpKZYMHY@nazgul.tnic>
From: Jan Kiszka <jan.kiszka@siemens.com>
In-Reply-To: <Y0GTUg1ACpKZYMHY@nazgul.tnic>
Content-Type: text/plain; charset="UTF-8"
X-Originating-IP: [139.25.68.37]
X-ClientProxiedBy: DEMCHDC8WBA.ad011.siemens.net (139.25.226.105) To
 DEMCHDC89XA.ad011.siemens.net (139.25.226.103)
X-TM-AS-Product-Ver: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-AS-Result: No-10--19.017700-8.000000
X-TMASE-MatchedRID: ObgwaKFsELAhz+KjBN9OufDMpLU9EzbQXKlUkWaHqwvx5KZMlKYS/XFa
	/hQHt1A1uSti1BoHqPa/jCH0Rcd4ASFDPhCO3zhjWO3sffakmrSULKc3M3OLX+ds4fnKv9CbT5y
	sQDj6eFk8cwBuO6HB35qG6AqjBmI1tQ6RnhDKnkCDC+22jz8Xi5v831J4kXLFsFkCLeeufNvESS
	xPxTa9gwaYevV4zG3ZjBYhGYtVarnOH38lNbOoTEwKCRzf8GZNB3U7YNIjWSM37vkU5XIl4IeAP
	CkZqxntBm9f7S94IJwlwoDYzPfxXyeOufXFPnmGPeqHl9AJspVMFlcbo5fDhC2416nc3bQlkYC3
	rjkUXRKUAUfla+IhaLKXWmEvaG3ElyyR46PvItPv291MwfmTC5H0YXYnbGozOX/V8P8ail2cIZL
	VZAQa0HhSEE8tGW+Gq7rFUcuGp/EgBwKKRHe+r+E2PD8v3QzJvTwTprSRTiLfqm6i3GCTZroQ3p
	6s8R2GK+LM6Wf90BQ=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--19.017700-8.000000
X-TMASE-Version: SMEX-14.0.0.3080-8.6.1018-26680.007
X-TM-SNTS-SMTP: 261D062BC881AE064030412BAF3C4AE581FC2F1906697EC91488ACB5DD6C9CAB2000:8
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VE1EUR01FT048:EE_|DU0PR10MB6108:EE_
X-MS-Office365-Filtering-Correlation-Id: f2630c55-55a4-4e17-920e-08daaa9bf1bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 04TMPTkG8DfTl/crYlea/0+mIoAQkz3AAvu6d2ZMBc8ZvRFqKpMv3Ve6B8x/W0zcv0Jw/RJilAGds0fR22cJok548yO4+VU3UM5wVVsDyJTHemVZAY4p2ju4BZmLrYaIvs+PO6wD4LjSZZ7MF+uNVPtH986pEinFSCuXwh34Q/w7FSqMNcuWLoBdfGzB9UWrJSxIbWfdddvRx7Irpuo+BkFRR4zLm8hQlW1Ai+x5HDKWG0+38aeAXZOgl7Dv3HWb7Bh37t0QF0OD+LSd6qCz+qG2ncgSvpJeFVWUC5s0bUYIXSrMlHTlY9PTb4f5ydhNL111z6q669I2Z8TRpzo98dxiJmDdp9TIpKxbF4RRlsADVOk04NH88rPRr7du9KYlh9+GPk8igGX05heEq/+67mioOaSAeocrEmdJiagfleqww8LCAUouXQGD0a5MT1ZtVN29DZUMzXTR5l/YQeubpxMIAqVwk3v+hFG69eLTJYGlFClD5STtrY/xlqtzJMYBMUU5okCjAOiGSNw87e3HyioI8msAIr42pooZbWQBchYb1uCpJ00xfMO1coY4TGIt6Egm5mqcOWP1ercbr4u3Mh92aTRvnkKV22UUr8jaxwWCGdfLMlvagvlVoPdfJ1yP+kEHoylDGI4hGAdvOmZttfRxY5cARrolX3FQHXQw2QfqSxHd7//6vT+QrFN9tyhZGBS5poQssczx3MXkWEm+tTldPtJVriTL0V5LdUN1Ozfc0O3ccm05aoC2nyk4zpRSzUpcm6sXNlaZfsNIldFnOGtlg/8xZaGgFd93kNBweufmTy7BLn7X5q8/ArKc1ged4yDuK0Q6SKm1nTerBMktIDgZbbOS9GWMEgfTaPxGBr2O4+61GzybcWpOGbJxYJg7YxpiTvqBAxIb39Pl+KAnDg==
X-Forefront-Antispam-Report: CIP:194.138.21.76;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:hybrid.siemens.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230022)(4636009)(376002)(39860400002)(136003)(346002)(396003)(451199015)(46966006)(40470700004)(36840700001)(478600001)(36860700001)(82740400003)(316002)(8676002)(6666004)(31686004)(82960400001)(44832011)(70206006)(4326008)(53546011)(26005)(5660300002)(956004)(2906002)(81166007)(336012)(31696002)(40480700001)(70586007)(6706004)(2616005)(186003)(54906003)(41300700001)(16576012)(966005)(83380400001)(356005)(110136005)(47076005)(40460700003)(16526019)(86362001)(82310400005)(8936002)(36756003)(7416002)(3940600001)(36900700001)(43740500002);DIR:OUT;SFP:1101;
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2022 08:46:37.8197
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f2630c55-55a4-4e17-920e-08daaa9bf1bc
X-MS-Exchange-CrossTenant-Id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;Ip=[194.138.21.76];Helo=[hybrid.siemens.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR01FT048.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB6108
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@siemens.com header.s=selector2 header.b=ahcKejpz;       arc=pass
 (i=1 spf=pass spfdomain=siemens.com dmarc=pass fromdomain=siemens.com);
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates
 40.107.20.55 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 08.10.22 17:12, Borislav Petkov wrote:
> Adding Xen and Jailhouse people and MLs to Cc.
> 
> Folks, thread starts here:
> 
> https://lore.kernel.org/r/1650035401-22855-1-git-send-email-ross.philipson@oracle.com
> 
> On Fri, Apr 15, 2022 at 11:10:00AM -0400, Ross Philipson wrote:
>> There are a number of places where early_memremap is called
>> but the return pointer is not checked for NULL. The call
>> can result in a NULL being returned so the checks must
>> be added.
>>
>> Signed-off-by: Ross Philipson <ross.philipson@oracle.com>
>> ---
>>  arch/x86/kernel/devicetree.c | 10 ++++++++++
>>  arch/x86/kernel/e820.c       |  5 +++++
>>  arch/x86/kernel/jailhouse.c  |  6 ++++++
>>  arch/x86/kernel/mpparse.c    | 23 +++++++++++++++++++++++
>>  arch/x86/kernel/setup.c      |  5 +++++
>>  arch/x86/xen/enlighten_hvm.c |  2 ++
>>  arch/x86/xen/mmu_pv.c        |  8 ++++++++
>>  arch/x86/xen/setup.c         |  2 ++
>>  8 files changed, 61 insertions(+)
> 
> Ok, a couple of notes:
> 
> 1. the pr_*("<prefix>:" ... )
> 
> thing is done using pr_fmt() - grep the tree for examples.
> 
> 2. I think you should not panic() the machine but issue a the
> warning/error and let the machine die a painful death anyway. But Xen
> folks will know better what would be the optimal thing to do.
> 
> Thx.
> 

For the Jailhouse bits:

Reviewed-by: Jan Kiszka <jan.kiszka@siemens.com>

(IOW, panic'ing is fine for us here)

Thanks,
Jan

-- 
Siemens AG, Technology
Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c4c35f8a-47ba-5e24-18e7-5190330c7e2c%40siemens.com.
