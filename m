Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBXGOQH3QKGQEVG24ICY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D071F4CA5
	for <lists+jailhouse-dev@lfdr.de>; Wed, 10 Jun 2020 06:53:48 +0200 (CEST)
Received: by mail-wr1-x439.google.com with SMTP id i6sf520399wrr.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 09 Jun 2020 21:53:48 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591764828; cv=pass;
        d=google.com; s=arc-20160816;
        b=vVxlRJhYmcOVR6OkFANGRGCu9SyabikWQ8OFGQhF90Ylul12+D2a5CbG1MmZS1yL7s
         3AksvcsUFW/S98132Px/DbBb1Bz3cZlsbq6uHEcmQRKCnAoPs28LFeic2vW+BdIwUwYK
         nA4CxNV9vp2Z2eeqESKdwRDeAL8j84JQJDjVzRbSjaOQHDHL2EC9cgmzSqKnoDafK14w
         sSqjDhV02dfPZqW/LItvAheo1jUdWumzV3NobjdoZq/BxzewjF1lqsZvC4u2ntfs6+t8
         Jz3+pbxG6ifsmtbREFS2qsZInw9RZdBaIU1D5AumFwEIhfi/HsvSOAJsBDXJhqwSbam8
         CXmg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=Y2p6d60DM3NC9RIdrMUtwHil6QUK5BUP+QVTdm4RlZc=;
        b=Ls+Zkw/sRqI+nxvABsDqvXlZNT4O2Fn85jK29+YWb8+tZcwoMaZOkCuzjEaEC839wc
         NDgQCG3WuIHCs72baxPlD5qj2PSXH7/pYrkGk7eqbymxd6Ybo9v1a1UJB843ZKFaO1gy
         YTKJgLEP3tbHQIv3g6ZJas7S9mxSOHvQspuzxiGxCTqOsTt9HjAyHFITUE0sZw90Igs0
         9zOmcXTa7mu5Z1OUCrsY8h3sofR+1TeubIpaEBYmTbL6IaJGS5Tjbj5sl0Mx4/20lOQs
         NYlqzQ8YT1T7WDfIqpmG1ybFx/V8aXBCLcNRjd11OmeA28BylVaz5lCLZh4zoxQZ8d64
         QAPg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Y2p6d60DM3NC9RIdrMUtwHil6QUK5BUP+QVTdm4RlZc=;
        b=rYe0YMojyhKfFFE1vnveX/QDi9dxA3+/GqwlplQpl/IoSiDcuHWkHn1we9Xscuz4/f
         74ADa2eq6/16L3ZKYQk3lKhsM3ICg68WejjozZXtNkGLNVVbh+Lytpl/3CXNioGJVgMV
         7sfTYfGLnoJ4J+V6xkpTsO1Bwl+fFklzEjVpFtoNO1ec4dZavoQFxMS9JEj6wLp52051
         CYVvinL1ILKOeL+IZK/rV1XW1lbZDr71Zc8IKv7TvLBcpvPglsA2f/MkhwvPl1lkAXKY
         QGVEg0KOW/KgPWEBqhUG3VoSifL9AhPwmftcKA/T/mXuGe3JSTmO855TQRbMph/cKFrl
         uNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Y2p6d60DM3NC9RIdrMUtwHil6QUK5BUP+QVTdm4RlZc=;
        b=bwSlLn2iBV44TkkMA7mH14beWZfcwg2pybsmqHdGX1vOz4Ng8zWOzCzukXddMs6c/g
         5LE6VV1vc8/Kz+34zDN1wb41l3MbCM/Qid2WFS8vnYvGfGabrpj1qAAbSTrWO68LBL2C
         HUDdbsGr/AUgnTBWWKkDCQqSKO3QJjB3MrD2/ap3InuGINo/Gbp/++jNlGs9sdDK3ngg
         LORS5cWp9Sa9Ygy7pBSQdkqqA806mtqk6iE6Kl3TwNm62IjF8WSHkMsHVOfPINa4f9dO
         EUekeCtELdRYcTb7INwCXtUD+4bmPcWOTBpgCRRRdgISIdsBL6qKd5AeL898K/C8dw7g
         60rQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530G+xScmAWG4qQvDVf0uPOd9sH5dFHHd52LQZK889iLGFAwrKVA
	ni/7cBxh/MMt+f0pEQjFbP0=
X-Google-Smtp-Source: ABdhPJwQBFdJma3WOEq18hNuDoVyW4IW2SELIC8GEeXi2X9//oN0e0PXyCiIU8X5Lr5sbreeesg5Fw==
X-Received: by 2002:adf:e588:: with SMTP id l8mr1468296wrm.255.1591764828556;
        Tue, 09 Jun 2020 21:53:48 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a7b:c959:: with SMTP id i25ls505826wml.2.gmail; Tue, 09 Jun
 2020 21:53:47 -0700 (PDT)
X-Received: by 2002:a1c:7305:: with SMTP id d5mr1258144wmb.85.1591764827696;
        Tue, 09 Jun 2020 21:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591764827; cv=none;
        d=google.com; s=arc-20160816;
        b=K/WQanNBwq0nx2/2u85UQDM7eKw2bk/sx7A21+5PcXdg4ywV/Ruxpu7TLRryPO12rD
         gBbcEDPonhbHxJtDW+Ftae5KlY9WrGu/avZPpGqfIBaPxutd0RhSs+yOjLJAtQksZmtf
         EdhbksOfpmojGc8t6gsU2LFbb19Tr6H+35CBQdeILoKe13eFgvcjOpcnjuX2YZftzeJO
         7N1GWdBZdsD/zdb7oblPQ4f2UYmhsEqujBZiLLZTbb6jvVdvuLPAuMt0JzTRbcdO33sy
         LSN2LyfiMTk/qo+dj6/r6vnvsoQy41t+tRneyYzHYPNn+wrd8n9ETQ/rx1UFfCfPQLWM
         GZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Jrmaq87RO03TN4UAus8kM5zmwa39R59kJ2a//MWOOKs=;
        b=y2xnnMF1ekQ7VN+8/1ajYYFdT44yE8Ci1yFt8CVP9qtX4bl2UVb3qKFNBhwxx/Fhb4
         3HVO7PUQ3tJ5rVl2rwK71o+bu1tCxxqI3crzP+wKXYLIAmG0cZTG7r9BindgNJxwjVMq
         NVEyo7/UPwYTF896S9MuInuvwtCg/iatdkt2BWDyBG7rP6SSGIcZ4fbqy1MR2F+eEyPo
         lcsv3zDeiS5mXCyWJGLvEso5UYQg3ncVy1qe6UHBhJoRRQsS2GZTkn9+g2UvCQchfiUl
         4QFNWhffywf8K/oO3klzoVPsryEs2wfWp4asxYA98564xJ/vAqhFWuSTZFtdnLHwLYNm
         APXQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id s137si203455wme.2.2020.06.09.21.53.47
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 09 Jun 2020 21:53:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 05A4rl22022273
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jun 2020 06:53:47 +0200
Received: from [139.22.36.66] ([139.22.36.66])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 05A4rk2o027718;
	Wed, 10 Jun 2020 06:53:46 +0200
Subject: Re: [PATCH 3/3] configs: x86: f2a88xm-hd3: remove unreferenced PCI
 capabilities
To: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
References: <20200609131143.2133316-1-andrej.utz@st.oth-regensburg.de>
 <20200609131143.2133316-3-andrej.utz@st.oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <535ef366-b345-a223-a9dd-1fffb2aac256@siemens.com>
Date: Wed, 10 Jun 2020 06:53:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200609131143.2133316-3-andrej.utz@st.oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=siemens.com
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

On 09.06.20 15:11, Andrej Utz wrote:
> Signed-off-by: Andrej Utz <andrej.utz@st.oth-regensburg.de>
> ---
>  configs/x86/f2a88xm-hd3.c | 43 +++++++++++----------------------------
>  1 file changed, 12 insertions(+), 31 deletions(-)
> 
> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
> index e5dfd78f..b529e6a6 100644
> --- a/configs/x86/f2a88xm-hd3.c
> +++ b/configs/x86/f2a88xm-hd3.c
> @@ -27,7 +27,7 @@ struct {
>  	struct jailhouse_irqchip irqchips[2];
>  	struct jailhouse_pio pio_regions[8];
>  	struct jailhouse_pci_device pci_devices[26];
> -	struct jailhouse_pci_capability pci_caps[27];
> +	struct jailhouse_pci_capability pci_caps[24];
>  } __attribute__((packed)) config = {
>  	.header = {
>  		.signature = JAILHOUSE_SYSTEM_SIGNATURE,
> @@ -384,7 +384,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0x8,
> -			.caps_start = 3,
> +			.caps_start = 0,
>  			.num_caps = 4,
>  			.num_msi_vectors = 1,
>  			.msi_64bits = 1,
> @@ -398,7 +398,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0x9,
> -			.caps_start = 3,
> +			.caps_start = 0,
>  			.num_caps = 4,
>  			.num_msi_vectors = 1,
>  			.msi_64bits = 1,
> @@ -440,7 +440,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0x19,
> -			.caps_start = 7,
> +			.caps_start = 4,
>  			.num_caps = 5,
>  			.num_msi_vectors = 1,
>  			.msi_64bits = 1,
> @@ -468,7 +468,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0x80,
> -			.caps_start = 12,
> +			.caps_start = 9,
>  			.num_caps = 4,
>  			.num_msi_vectors = 8,
>  			.msi_64bits = 1,
> @@ -482,7 +482,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0x81,
> -			.caps_start = 12,
> +			.caps_start = 9,
>  			.num_caps = 4,
>  			.num_msi_vectors = 8,
>  			.msi_64bits = 1,
> @@ -496,7 +496,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0x88,
> -			.caps_start = 16,
> +			.caps_start = 13,
>  			.num_caps = 2,
>  			.num_msi_vectors = 8,
>  			.msi_64bits = 1,
> @@ -524,7 +524,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0x92,
> -			.caps_start = 18,
> +			.caps_start = 15,
>  			.num_caps = 2,
>  			.num_msi_vectors = 0,
>  			.msi_64bits = 0,
> @@ -552,7 +552,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0x9a,
> -			.caps_start = 18,
> +			.caps_start = 15,
>  			.num_caps = 2,
>  			.num_msi_vectors = 0,
>  			.msi_64bits = 0,
> @@ -580,7 +580,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0xa2,
> -			.caps_start = 20,
> +			.caps_start = 17,
>  			.num_caps = 1,
>  			.num_msi_vectors = 0,
>  			.msi_64bits = 0,
> @@ -678,7 +678,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0xc3,
> -			.caps_start = 21,
> +			.caps_start = 18,
>  			.num_caps = 1,
>  			.num_msi_vectors = 0,
>  			.msi_64bits = 0,
> @@ -720,7 +720,7 @@ struct {
>  			.iommu = 0,
>  			.domain = 0x0,
>  			.bdf = 0x100,
> -			.caps_start = 22,
> +			.caps_start = 19,
>  			.num_caps = 5,
>  			.num_msi_vectors = 1,
>  			.msi_64bits = 1,
> @@ -731,25 +731,6 @@ struct {
>  	},
>  
>  	.pci_caps = {
> -		/* PCIDevice: 00:00.2 */
> -		{
> -			.id = PCI_CAP_ID_SECDEV,
> -			.start = 0x40,
> -			.len = 2,
> -			.flags = 0,
> -		},
> -		{
> -			.id = PCI_CAP_ID_MSI,
> -			.start = 0x54,
> -			.len = 14,
> -			.flags = JAILHOUSE_PCICAPS_WRITE,
> -		},
> -		{
> -			.id = PCI_CAP_ID_HT,
> -			.start = 0x64,
> -			.len = 2,
> -			.flags = 0,
> -		},
>  		/* PCIDevice: 00:01.0 */
>  		/* PCIDevice: 00:01.1 */
>  		{
> 

All 3 applied to next.

Thanks,
Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/535ef366-b345-a223-a9dd-1fffb2aac256%40siemens.com.
