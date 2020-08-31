Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBW73WX5AKGQERT7WSTY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33f.google.com (mail-wm1-x33f.google.com [IPv6:2a00:1450:4864:20::33f])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A89925842F
	for <lists+jailhouse-dev@lfdr.de>; Tue,  1 Sep 2020 00:46:52 +0200 (CEST)
Received: by mail-wm1-x33f.google.com with SMTP id x81sf289834wmg.8
        for <lists+jailhouse-dev@lfdr.de>; Mon, 31 Aug 2020 15:46:52 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598914012; cv=pass;
        d=google.com; s=arc-20160816;
        b=atOYp+udJciRAj8IgTeperxf+mkxMiufXqJTjDN25lP9Jq5B74ucUYRIZLQZnKiqFJ
         9xw9Za7nHfB1C6mv4QOooIJycVw4qaa4kcaxgebQqc4hUh965Wc5gQhemzSA9tchqpZ0
         dUtlZl0/plUl6B6eTI5dTyQ+WUq6NjZR77lnSorOXViIQUwmulCIjBdTWGf4SgwyyEBn
         1VDMkL/SN7L88ETjEEEkd7tf7aLPmy3cU8zgSNc/zvSMMdJiQQXW153V7KuqXRgRXL5l
         lb7iBjcYcVj0pwy77jxq+qW8a2rcBOSR4Z/D3qMdrqvZAGncFPL1nhg15xaM7dleArMw
         pEEw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:references:to:from:subject
         :sender:dkim-signature;
        bh=hCFHBqTYPbzw1Gnz1afUazQef1XzPXWYd/Ebc2JXwJk=;
        b=SFX3VtHhR5+Dady6RxcfgGCre6jiT1ZaLQSDsrliy2zxcWqtRq8o0BYkVxBCgw1H+M
         Lss8iDJ7ahvR9wYlBYiSkO2j44SBXDuvH8FRnQqcJnM00eP2+xFOGJ78LtfoZYkpJWQd
         k+Xbr+VD2LIKX3UwVanpn92ApGmb08Jgt7ZlV0CYtR5LqZUUu2ZpJQmBY8tbYQYihU2h
         SK0ztgL8/K3QuqylPVGC/SODDJPL/2LS0Qq5mejjXiHu/a6XCn/kZSU4XxTCPlSD2Qgc
         oI6spudYA+GMjm0wcmNAtq1ZM6rQHVRmy8o0Kc0RZVLZxDJ0b1wt88QFjBHa3/fPFbf/
         kE7g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=hCFHBqTYPbzw1Gnz1afUazQef1XzPXWYd/Ebc2JXwJk=;
        b=LjaVgBuJh79ZaNh6WsxEYP2EQM+pkGaylhpofIs55xMBKBcQh8JcPa6zVyGNnRI84C
         ZfIyDNJCEL1dZ4e40kw+xvVKLLVSikWiClyJ9TBHf71NBEA7xgP7B+Twl75hu9e9yhSd
         Fkrf1vNevUE18AFafz8tP5EYUOubLUklRpU44cUp0ycJfGw/UDKVrKGJhR86w7EVeG13
         TIM5UOlEIYO9uOxhUDlK4OmSfYff2LucwSC9FL1kkPWcB/KTpIMyu2epK6Jc+zu6762N
         vntzIIVyuj0tvr1t4l/UBocbdoHN9mca3n2fSFE2CiIinc2Eg/ic690KBU+/JxIZ4rzw
         M24Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=hCFHBqTYPbzw1Gnz1afUazQef1XzPXWYd/Ebc2JXwJk=;
        b=ZwyVRfmSaZ02QEE8eAkMI7ZBkbyQD4c5Ru7btufYjHDlpbyihMQK+yZWtoN2AZu+8x
         CIErOsR9In0m1Ur3abB5mm3YK0ZA/jRcsm1Wsejkf9Cxsa7myaE45zgzleOxnphAlT8y
         tuWc7i6f57skKyoomm2NRxGU9eAwF6C7F+5JsRRtCr8Cw+3blx+jbgLYFRBRKzhGZ8bg
         eFHNvAbOHMiW1KRy5AL/u/NQg64yaz47D9L6E0UcPJaJSv+q+Ce/GPxyzS7zs8kdJgvp
         UKcZyXfqh0lRLwxormaZGQODSxYFPiXcYWyr/yfhcqo+uftH7DbdSOAqY5lL/aGcMAXN
         dXeQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531jc23QGLl3GmrBp5W+Xz14PmmkkLKThulgAyT8oao5ITlJrJVZ
	y8aK42p1ofriv7u9eN9wgGs=
X-Google-Smtp-Source: ABdhPJw8qe/O2Jvc5Y76maNpiqEdWBGEpYi7vYTxSB+7uzMpCkv03shiw42RqTmmRf8Yb2IiOYtU/A==
X-Received: by 2002:a1c:96c5:: with SMTP id y188mr1383568wmd.72.1598914012153;
        Mon, 31 Aug 2020 15:46:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:dd0a:: with SMTP id a10ls534603wrm.2.gmail; Mon, 31 Aug
 2020 15:46:51 -0700 (PDT)
X-Received: by 2002:adf:fe43:: with SMTP id m3mr3548902wrs.19.1598914011469;
        Mon, 31 Aug 2020 15:46:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598914011; cv=none;
        d=google.com; s=arc-20160816;
        b=RWwx4a6qHa+rMAFomArR0ec8r398WYF7Lt/b2jNf6KGKs49H50WoNCizG2XRVQCxc5
         A799m1uOWjadlOH93O3OteSHBE+YGHTy6ZS1xWDG41gI0Wwuv1TSYC9NuK9z8L/RT/O4
         MhOemWXrfsTS8b585fkbcCg3xoaILaI7OL+Xx68iSsjrJV+riYymGybY643u2QuwKo2F
         YzMCURItQmDicDNFrY99Td/M/AdQ5V95xqDv4z/cywUQWLa2tuiuJJsuFqKU132hMe1U
         d+YjdeBx4JD5enMsaSuSqWQXOiXVIkdcR4cRy7c5TiDoD9s2UHsd1o4EVPzgmx8MLsHm
         eTWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from:subject;
        bh=gIVwcBwga/HjfwHllrAWkCukCyfw+SNtbfAZ/Tmx9Ro=;
        b=IXr0s7iQbnGBLXn0E/xPZrapy6uh7Fy9LYU0weYpfqEeSWTkjHem7oOX7rBbhzaeJZ
         dycrWAdGdzdFG9rJFsI0VO++eFY4uOnQE2+cboL/MVWgzd5ilm9WLa9xNKTPG2L2qoNy
         HWieMZonNRQ0N1iOkLTgGiJU2SRbc5yD9ekLMXzQBRrjafhk3K+Ta2jJhM+tYhwpUSSN
         3x67+ccjoRvEGLzEMn5I8WIE5TDdNoQyeniOGbjDqOf3rH5G08r4pGP8Voe5Em2zOuOR
         7wPO7rz7h57ckz0INj7zadLVD7upULYcppTK1iTaqBw1zNVMJWwcAQ7FEUL+M9tXwoZW
         KE1g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id q2si256657wrx.4.2020.08.31.15.46.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 31 Aug 2020 15:46:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 07VMkpJe018008
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 00:46:51 +0200
Received: from [167.87.240.215] ([167.87.240.215])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07VMko3H006944
	for <jailhouse-dev@googlegroups.com>; Tue, 1 Sep 2020 00:46:51 +0200
Subject: Re: [jh-images][PATCH 6/5] jailhouse: Fix build of x86 configs with
 latest version
From: Jan Kiszka <jan.kiszka@siemens.com>
To: jailhouse-dev@googlegroups.com
References: <cover.1598871229.git.jan.kiszka@siemens.com>
 <a15c05e5-4658-fb0c-474c-20a46f5cf178@siemens.com>
Message-ID: <53838e14-298a-9009-b366-0ecdb96f3d0e@siemens.com>
Date: Tue, 1 Sep 2020 00:46:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <a15c05e5-4658-fb0c-474c-20a46f5cf178@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 31.08.20 18:05, Jan Kiszka wrote:
> From: Jan Kiszka <jan.kiszka@siemens.com>
> 
> The IOMMU data structure in platform_info got relocated. Account for
> that.
> 
> Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
> ---
>  recipes-jailhouse/jailhouse/files/ipc127e.c   | 24 +++++++++----------
>  .../files/{ipc127e.c => ipc127e_0.12.c}       |  0
>  recipes-jailhouse/jailhouse/files/nuc6cay.c   | 24 +++++++++----------
>  .../files/{nuc6cay.c => nuc6cay_0.12.c}       |  0
>  recipes-jailhouse/jailhouse/jailhouse_0.12.bb | 10 ++++++++
>  .../jailhouse/jailhouse_latest.bb             |  5 ++++
>  6 files changed, 39 insertions(+), 24 deletions(-)
>  copy recipes-jailhouse/jailhouse/files/{ipc127e.c => ipc127e_0.12.c} (100%)
>  copy recipes-jailhouse/jailhouse/files/{nuc6cay.c => nuc6cay_0.12.c} (100%)
> 
> diff --git a/recipes-jailhouse/jailhouse/files/ipc127e.c b/recipes-jailhouse/jailhouse/files/ipc127e.c
> index 021e4ba..7486baa 100644
> --- a/recipes-jailhouse/jailhouse/files/ipc127e.c
> +++ b/recipes-jailhouse/jailhouse/files/ipc127e.c
> @@ -63,21 +63,21 @@ struct {
>  		.platform_info = {
>  			.pci_mmconfig_base = 0xe0000000,
>  			.pci_mmconfig_end_bus = 0x3f,
> +			.iommu_units = {
> +				{
> +					.type = JAILHOUSE_IOMMU_INTEL,
> +					.base = 0xfed64000,
> +					.size = 0x1000,
> +				},
> +				{
> +					.type = JAILHOUSE_IOMMU_INTEL,
> +					.base = 0xfed65000,
> +					.size = 0x1000,
> +				},
> +			},
>  			.x86 = {
>  				.pm_timer_address = 0x408,
>  				.vtd_interrupt_limit = 256,
> -				.iommu_units = {
> -					{
> -						.type = JAILHOUSE_IOMMU_INTEL,
> -						.base = 0xfed64000,
> -						.size = 0x1000,
> -					},
> -					{
> -						.type = JAILHOUSE_IOMMU_INTEL,
> -						.base = 0xfed65000,
> -						.size = 0x1000,
> -					},
> -				},
>  			},
>  		},
>  		.root_cell = {
> diff --git a/recipes-jailhouse/jailhouse/files/ipc127e.c b/recipes-jailhouse/jailhouse/files/ipc127e_0.12.c
> similarity index 100%
> copy from recipes-jailhouse/jailhouse/files/ipc127e.c
> copy to recipes-jailhouse/jailhouse/files/ipc127e_0.12.c
> diff --git a/recipes-jailhouse/jailhouse/files/nuc6cay.c b/recipes-jailhouse/jailhouse/files/nuc6cay.c
> index c3b489c..8fde83e 100644
> --- a/recipes-jailhouse/jailhouse/files/nuc6cay.c
> +++ b/recipes-jailhouse/jailhouse/files/nuc6cay.c
> @@ -63,21 +63,21 @@ struct {
>  		.platform_info = {
>  			.pci_mmconfig_base = 0xe0000000,
>  			.pci_mmconfig_end_bus = 0xff,
> +			.iommu_units = {
> +				{
> +					.type = JAILHOUSE_IOMMU_INTEL,
> +					.base = 0xfed64000,
> +					.size = 0x1000,
> +				},
> +				{
> +					.type = JAILHOUSE_IOMMU_INTEL,
> +					.base = 0xfed65000,
> +					.size = 0x1000,
> +				},
> +			},
>  			.x86 = {
>  				.pm_timer_address = 0x408,
>  				.vtd_interrupt_limit = 256,
> -				.iommu_units = {
> -					{
> -						.type = JAILHOUSE_IOMMU_INTEL,
> -						.base = 0xfed64000,
> -						.size = 0x1000,
> -					},
> -					{
> -						.type = JAILHOUSE_IOMMU_INTEL,
> -						.base = 0xfed65000,
> -						.size = 0x1000,
> -					},
> -				},
>  			},
>  		},
>  		.root_cell = {
> diff --git a/recipes-jailhouse/jailhouse/files/nuc6cay.c b/recipes-jailhouse/jailhouse/files/nuc6cay_0.12.c
> similarity index 100%
> copy from recipes-jailhouse/jailhouse/files/nuc6cay.c
> copy to recipes-jailhouse/jailhouse/files/nuc6cay_0.12.c
> diff --git a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
> index c0b5da3..ec0a41a 100644
> --- a/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
> +++ b/recipes-jailhouse/jailhouse/jailhouse_0.12.bb
> @@ -22,3 +22,13 @@ SRC_URI += " \
>      "
>  
>  SRCREV = "92db71f257fabd3c08fa4b99498fa61a41ea831d"
> +
> +EXTRA_JAILHOUSE_CONFIGS_amd64 += " \
> +    nuc6cay_0.12.c \
> +    ipc127e_0.12.c \
> +    "
> +
> +do_prepare_build_append() {

Must be "do_prepare_build_append_amd64" to not break other arch. A v2 of
the series will follow soon.

Jan

> +    mv ${S}/configs/x86/nuc6cay_0.12.c ${S}/configs/x86/nuc6cay.c
> +    mv ${S}/configs/x86/ipc127e_0.12.c ${S}/configs/x86/ipc127e.c
> +}
> diff --git a/recipes-jailhouse/jailhouse/jailhouse_latest.bb b/recipes-jailhouse/jailhouse/jailhouse_latest.bb
> index 143fa0e..b21abf7 100644
> --- a/recipes-jailhouse/jailhouse/jailhouse_latest.bb
> +++ b/recipes-jailhouse/jailhouse/jailhouse_latest.bb
> @@ -14,6 +14,11 @@ require jailhouse.inc
>  SRCREV = "next"
>  PV = "0.9999-next"
>  
> +EXTRA_JAILHOUSE_CONFIGS_amd64 += " \
> +    nuc6cay.c \
> +    ipc127e.c \
> +    "
> +
>  dpkg_runbuild_prepend() {
>      bbplain $(printf "jailhouse-latest: Building revision %.12s\n" \
>                       $(cat ${S}/.git/refs/heads/next))
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/53838e14-298a-9009-b366-0ecdb96f3d0e%40siemens.com.
