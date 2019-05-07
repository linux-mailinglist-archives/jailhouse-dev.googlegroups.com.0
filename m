Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBCUUY7TAKGQE6DGTNUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x539.google.com (mail-ed1-x539.google.com [IPv6:2a00:1450:4864:20::539])
	by mail.lfdr.de (Postfix) with ESMTPS id 29D03169F0
	for <lists+jailhouse-dev@lfdr.de>; Tue,  7 May 2019 20:10:19 +0200 (CEST)
Received: by mail-ed1-x539.google.com with SMTP id h7sf6489312edb.14
        for <lists+jailhouse-dev@lfdr.de>; Tue, 07 May 2019 11:10:19 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557252619; cv=pass;
        d=google.com; s=arc-20160816;
        b=kO4hB6TBMAuRYNOPI/s7mXRcab9r4DU3LbWomz3bOPdNAnxW9dGavPhkWJAJqky8n5
         EjfZh413nGzxjeLahJYaQwifsGZHbKTRrApHpGRQhRnuYuagxaOe1RiNLsSNiuXFd1Qn
         UX0mBeOQj3aRzKJfJxAXxFk0EOpSriVQDZp383EAYVfPcSbKaIfoA73klIyTIYfUHXCj
         oox9HIgFk0z4vjlsztL7290JVwEFJym4EFDP2pxmXwgst6vgJ7gHwGe6Bo4uTWg7u5zi
         OXu++7j2779zzC5hrVhRTLoJly2JTdJpaRFzyHkfaI9ydR/eHR57cE87bjgMH4OtWsPs
         3oiQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=EudhgFU5ZFpvC521b8wOrQTKoyB3TS4zEIZD1uQKDMs=;
        b=rueUwh6z/oqvF/ML8kayu9D6Qi+z9MyLKa4yEgI2/Sqjufgx1LeH2LecVmSUp0wHoB
         CrDeTYYFcJ/MIuD9jNvc1Hg5pQs27D6XxHx3F4/QcMTxI1TaeqBSJ1DJUlSwuuXolC1w
         EyWWlHCR30BQy/e+zerL9YK/4zxorXnm8LcdjCxv5Zj8sBVlbLYkWHLZWB0GeBo8hgjL
         yuBU2A2aQ6b7e91T/OAYIQkGno73ZjjNSDYdkreY8jq5LWZeU5XqoSlcxBjcY3V+sR55
         I+qtNDPLCB3fohCMisSV8kDjgZ0myLwZUTCPL0K7IM4x5ndiY8XUXFOo8ZY2G5xizBjl
         TniQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=EudhgFU5ZFpvC521b8wOrQTKoyB3TS4zEIZD1uQKDMs=;
        b=bpwXEmJmVW9tDD/AL3uwDldGzxzUBF2TzBsZFuyQUJ5T9oov2LE6cAuq0M8XUMkD5L
         CiYL1+EyI12RgEnVZOonZXazPL/MngDFYKGSScfU39P3E+Kx66htzyD0taEK8t2ELCkT
         z4n4lxLzdJfDirYDfQTo0nYFVAlngZrx39XA/j51IjCRpEEWvYUxknmcE/DmAhz3dNPr
         qRbStF8cFIm4RHPV8UqzPBkemARYcifa4R5R37OwdHpmYZt8ej8TTBIXvKzUmvEDbE60
         eeDLPEPSrtU6Ovy7JmJky17I7O7fquHcuPJ1wIWic8Xo/gQ/4PVSVJB8i6479HY/5CoK
         dpVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=EudhgFU5ZFpvC521b8wOrQTKoyB3TS4zEIZD1uQKDMs=;
        b=BIhPzTS4g5EZD5jkJdHf1uQzbqL9Br4wV/XJXLM0S/ElbscN8DTXqDYQRxqsre9Bqt
         Fn9GpVSq57K1maFJ96tIYW13H96Rkf16zbprgDtwFqGkDijD0vXWcTq5fCA0RxMA07Xh
         dDdgQHLBql8hcUPJoISJLGvTJsseBBUIRv+WmQu4xc1Ha/KwCNR6JQGTXElg2AnGtsPG
         qmCVqfCWnqQImQQaOpeNNakhOZIwI3+9mvW3ztHnEiooQvFLpC587ZFbfQEXCsZgsfdH
         JHQDzadXAY2vHVAxK4nbXKyPvmj0kIqkDGHip5PXR89BaO9GQZIbEcVWYUl6aKDFXCnA
         rKAA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXIywjLP/CW7kvnik8bjw9bCF+AvNsl+susXtCHAcjz8YKTyWJw
	nrDsCbPuxSojx2cw1uv+mKQ=
X-Google-Smtp-Source: APXvYqxuH3mebH8DV2r7bUcJ2TteXPPMx1s75VqUryFoVMbvt3+Ntx75SIgi0ucSJe2oSD0ME1zmQQ==
X-Received: by 2002:a50:9405:: with SMTP id p5mr9293730eda.111.1557252618886;
        Tue, 07 May 2019 11:10:18 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:1dd3:: with SMTP id v19ls2652923ejh.13.gmail; Tue,
 07 May 2019 11:10:18 -0700 (PDT)
X-Received: by 2002:a17:906:685:: with SMTP id u5mr26084249ejb.125.1557252617972;
        Tue, 07 May 2019 11:10:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557252617; cv=none;
        d=google.com; s=arc-20160816;
        b=WeRt6MV+XG7sk+4hg7zz2EKyMe4rrp1IIlqPlWGzRBs1ZqVhW2Du8SleQIVOAwuiAJ
         sQxYs4UEovJjSH/Q9Ek0yg0SdICXq0A+Y7wBb4hOM46AMigbTbjUssMEKdBadOyks0ed
         IKD6TpdK8mmMPfdH0J9dHvfFbEYjY1/WMceZkMiuh4tldjd/9qGrPAKQdUsOEomCGEkO
         zSpVBNSeMhrQuH1TrCJxvrm0wz/dYVo4boxFAnAM+kfea4e9CI3zT39MkA5058+WrHNK
         Q/JPv0HAhYu7G+hcfISV/cFhs+FD5rSWkG2c+giZM9wl9ekw8OrJC6EFkNvYpl+gA9T2
         If9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=uW7L+R09Mu6H+ABKOg5lrsSUaOMfGE+VPz7jK0WZ9xo=;
        b=inUarmsk/qZ7HMyLkS3ZJZyn8g1f9GfTJ2e0gz7gt76LcF+esxAaHxJ0BKnxmUTAwE
         SYPwxBjIHfqbLpEwFJpGkujmjFUmASHDoKUn/JNz5hfvWATS5mW8KbI/k/hBzi4YDZxS
         Ecv8/DmwSLA1arvyZzfRVVJWy3EoXkPjmLHAXaUFZGGTezLSqOFA36LMfImlyjzo/0vW
         FP6zypY7oZsqpbg2N7FZR6jKJUin52ZgUZ+n7bqOQ2hCBHb47SbLvn+fmLaD5/QHQW6b
         7aWKtH+jpY/0fBiWEChIvsJD5pQGYBfUpAdpUm9P/TOIK16cwx1C0n/x7OAU4Mcg+xOF
         H4EA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id z45si746696edc.3.2019.05.07.11.10.17
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 11:10:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id x47IAH50010877
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 May 2019 20:10:17 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x47IAHsS013149;
	Tue, 7 May 2019 20:10:17 +0200
Subject: Re: [PATCH v2 1/7] pci, configs: unmystify magic constants
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190506221110.19495-1-ralf.ramsauer@oth-regensburg.de>
 <20190506221110.19495-2-ralf.ramsauer@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <08e7bb21-24b1-0b9a-1644-f9793a28daf0@siemens.com>
Date: Tue, 7 May 2019 20:10:16 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <20190506221110.19495-2-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
 permitted sender) smtp.mailfrom=jan.kiszka@siemens.com
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

On 07.05.19 00:11, Ralf Ramsauer wrote:
> Some sugar for the guidance of the reader. Use speaking name instead of
> hard-coded constants.
> 
> This patch was supported by:
> $ git grep -l "\.id = 0x1"  | xargs sed -i 's/id = 0x1,/id = PCI_CAP_ID_PM,/'
> $ git grep -l "\.id = 0x3"  | xargs sed -i 's/id = 0x3,/id = PCI_CAP_ID_VPD,/'
> $ git grep -l "\.id = 0x5"  | xargs sed -i 's/id = 0x5,/id = PCI_CAP_ID_MSI,/'
> $ git grep -l "\.id = 0x8"  | xargs sed -i 's/id = 0x8,/id = PCI_CAP_ID_HT,/'
> $ git grep -l "\.id = 0x9"  | xargs sed -i 's/id = 0x9,/id = PCI_CAP_ID_VNDR,/'
> $ git grep -l "\.id = 0xa"  | xargs sed -i 's/id = 0xa,/id = PCI_CAP_ID_DBG,/'
> $ git grep -l "\.id = 0xd"  | xargs sed -i 's/id = 0xd,/id = PCI_CAP_ID_SSVID,/'
> $ git grep -l "\.id = 0xf"  | xargs sed -i 's/id = 0xf,/id = PCI_CAP_ID_SECDEV,/'
> $ git grep -l "\.id = 0x10" | xargs sed -i 's/id = 0x10,/id = PCI_CAP_ID_EXP,/'
> $ git grep -l "\.id = 0x11" | xargs sed -i 's/id = 0x11,/id = PCI_CAP_ID_MSIX,/'
> $ git grep -l "\.id = 0x12" | xargs sed -i 's/id = 0x12,/id = PCI_CAP_ID_SATA,/'
> $ git grep -l "\.id = 0x13" | xargs sed -i 's/id = 0x13,/id = PCI_CAP_ID_AF,/'
> 
> Extended cap ids were manually replaced.
> 
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>   configs/x86/e1000-demo.c        |  2 +-
>   configs/x86/f2a88xm-hd3.c       | 54 ++++++++++++++++-----------------
>   configs/x86/imb-a180.c          | 52 +++++++++++++++----------------
>   configs/x86/linux-x86-demo.c    | 12 ++++----
>   configs/x86/pci-demo.c          |  2 +-
>   configs/x86/qemu-x86.c          | 20 ++++++------
>   include/jailhouse/cell-config.h | 16 ++++++++++
>   7 files changed, 87 insertions(+), 71 deletions(-)
> 
> diff --git a/configs/x86/e1000-demo.c b/configs/x86/e1000-demo.c
> index 1c602883..54823721 100644
> --- a/configs/x86/e1000-demo.c
> +++ b/configs/x86/e1000-demo.c
> @@ -99,7 +99,7 @@ struct {
>   
>   	.pci_caps = {
>   		{ /* Intel e1000 @00:19.0 */
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0xd0,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
> diff --git a/configs/x86/f2a88xm-hd3.c b/configs/x86/f2a88xm-hd3.c
> index d5320d7b..258e33c8 100644
> --- a/configs/x86/f2a88xm-hd3.c
> +++ b/configs/x86/f2a88xm-hd3.c
> @@ -739,19 +739,19 @@ struct {
>   	.pci_caps = {
>   		/* PCIDevice: 00:00.2 */
>   		{
> -			.id = 0xf,
> +			.id = PCI_CAP_ID_SECDEV,
>   			.start = 0x40,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x54,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x8,
> +			.id = PCI_CAP_ID_HT,
>   			.start = 0x64,
>   			.len = 2,
>   			.flags = 0,
> @@ -759,56 +759,56 @@ struct {
>   		/* PCIDevice: 00:01.0 */
>   		/* PCIDevice: 00:01.1 */
>   		{
> -			.id = 0x9,
> +			.id = PCI_CAP_ID_VNDR,
>   			.start = 0x48,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x50,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0x58,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0xa0,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		/* PCIDevice: 00:03.1 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x50,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0x58,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0xa0,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0xd,
> +			.id = PCI_CAP_ID_SSVID,
>   			.start = 0xb0,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x8,
> +			.id = PCI_CAP_ID_HT,
>   			.start = 0xb8,
>   			.len = 2,
>   			.flags = 0,
> @@ -816,38 +816,38 @@ struct {
>   		/* PCIDevice: 00:10.0 */
>   		/* PCIDevice: 00:10.1 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x50,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x70,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x11,
> +			.id = PCI_CAP_ID_MSIX,
>   			.start = 0x90,
>   			.len = 12,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0xa0,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		/* PCIDevice: 00:11.0 */
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x50,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x12,
> +			.id = PCI_CAP_ID_SATA,
>   			.start = 0x70,
>   			.len = 2,
>   			.flags = 0,
> @@ -855,58 +855,58 @@ struct {
>   		/* PCIDevice: 00:12.2 */
>   		/* PCIDevice: 00:13.2 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0xc0,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0xa,
> +			.id = PCI_CAP_ID_DBG,
>   			.start = 0xe4,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		/* PCIDevice: 00:14.2 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x50,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		/* PCIDevice: 00:18.3 */
>   		{
> -			.id = 0xf,
> +			.id = PCI_CAP_ID_SECDEV,
>   			.start = 0xf0,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		/* PCIDevice: 01:00.0 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x40,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x50,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0x70,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x11,
> +			.id = PCI_CAP_ID_MSIX,
>   			.start = 0xb0,
>   			.len = 12,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x3,
> +			.id = PCI_CAP_ID_VPD,
>   			.start = 0xd0,
>   			.len = 2,
>   			.flags = 0,
> diff --git a/configs/x86/imb-a180.c b/configs/x86/imb-a180.c
> index 9073a4ac..b083d341 100644
> --- a/configs/x86/imb-a180.c
> +++ b/configs/x86/imb-a180.c
> @@ -615,25 +615,25 @@ struct {
>   		/* PCIDevice: 00:01.0 */
>   		/* PCIDevice: 00:01.1 */
>   		{
> -			.id = 0x9,
> +			.id = PCI_CAP_ID_VNDR,
>   			.start = 0x48,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x50,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0x58,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0xa0,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
> @@ -641,81 +641,81 @@ struct {
>   		/* PCIDevice: 00:02.3 */
>   		/* PCIDevice: 00:02.4 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x50,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0x58,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0xa0,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0xd,
> +			.id = PCI_CAP_ID_SSVID,
>   			.start = 0xb0,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x8,
> +			.id = PCI_CAP_ID_HT,
>   			.start = 0xb8,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		/* PCIDevice: 00:10.0 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x50,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x70,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x11,
> +			.id = PCI_CAP_ID_MSIX,
>   			.start = 0x90,
>   			.len = 12,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0xa0,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		/* PCIDevice: 00:11.0 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x60,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x12,
> +			.id = PCI_CAP_ID_SATA,
>   			.start = 0x70,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x50,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x13,
> +			.id = PCI_CAP_ID_AF,
>   			.start = 0xd0,
>   			.len = 2,
>   			.flags = 0,
> @@ -723,27 +723,27 @@ struct {
>   		/* PCIDevice: 00:12.2 */
>   		/* PCIDevice: 00:13.2 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0xc0,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0xa,
> +			.id = PCI_CAP_ID_DBG,
>   			.start = 0xe4,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		/* PCIDevice: 00:14.2 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x50,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		/* PCIDevice: 00:18.3 */
>   		{
> -			.id = 0xf,
> +			.id = PCI_CAP_ID_SECDEV,
>   			.start = 0xf0,
>   			.len = 2,
>   			.flags = 0,
> @@ -754,31 +754,31 @@ struct {
>   		/* PCIDevice: 01:00.3 */
>   		/* PCIDevice: 02:00.0 */
>   		{
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0x40,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x50,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0x70,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x11,
> +			.id = PCI_CAP_ID_MSIX,
>   			.start = 0xb0,
>   			.len = 12,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x3,
> +			.id = PCI_CAP_ID_VPD,
>   			.start = 0xd0,
>   			.len = 2,
>   			.flags = 0,
> diff --git a/configs/x86/linux-x86-demo.c b/configs/x86/linux-x86-demo.c
> index af8c6da4..67e2d849 100644
> --- a/configs/x86/linux-x86-demo.c
> +++ b/configs/x86/linux-x86-demo.c
> @@ -180,37 +180,37 @@ struct {
>   
>   	.pci_caps = {
>   		{ /* e1000e */
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0xc8,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0xd0,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0xe0,
>   			.len = 20,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x11,
> +			.id = PCI_CAP_ID_MSIX,
>   			.start = 0xa0,
>   			.len = 12,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
> +			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
>   			.start = 0x100,
>   			.len = 4,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
> +			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
>   			.start = 0x140,
>   			.len = 4,
>   			.flags = 0,
> diff --git a/configs/x86/pci-demo.c b/configs/x86/pci-demo.c
> index c5719459..df026f15 100644
> --- a/configs/x86/pci-demo.c
> +++ b/configs/x86/pci-demo.c
> @@ -96,7 +96,7 @@ struct {
>   
>   	.pci_caps = {
>   		{ /* Intel HDA @00:1b.0 */
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x60,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> index 68b8f18d..bd789cdf 100644
> --- a/configs/x86/qemu-x86.c
> +++ b/configs/x86/qemu-x86.c
> @@ -316,7 +316,7 @@ struct {
>   
>   	.pci_caps = {
>   		{ /* ICH HD audio */
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x60,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
> @@ -327,55 +327,55 @@ struct {
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{ /* AHCI */
> -			.id = 0x12,
> +			.id = PCI_CAP_ID_SATA,
>   			.start = 0xa8,
>   			.len = 2,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0x80,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{ /* virtio-9p-pci */
> -			.id = 0x11,
> +			.id = PCI_CAP_ID_MSIX,
>   			.start = 0x98,
>   			.len = 12,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{ /* e1000e */
> -			.id = 0x1,
> +			.id = PCI_CAP_ID_PM,
>   			.start = 0xc8,
>   			.len = 8,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x5,
> +			.id = PCI_CAP_ID_MSI,
>   			.start = 0xd0,
>   			.len = 14,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x10,
> +			.id = PCI_CAP_ID_EXP,
>   			.start = 0xe0,
>   			.len = 20,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x11,
> +			.id = PCI_CAP_ID_MSIX,
>   			.start = 0xa0,
>   			.len = 12,
>   			.flags = JAILHOUSE_PCICAPS_WRITE,
>   		},
>   		{
> -			.id = 0x1 | JAILHOUSE_PCI_EXT_CAP,
> +			.id = PCI_EXT_CAP_ID_ERR | JAILHOUSE_PCI_EXT_CAP,
>   			.start = 0x100,
>   			.len = 4,
>   			.flags = 0,
>   		},
>   		{
> -			.id = 0x3 | JAILHOUSE_PCI_EXT_CAP,
> +			.id = PCI_EXT_CAP_ID_DSN | JAILHOUSE_PCI_EXT_CAP,
>   			.start = 0x140,
>   			.len = 4,
>   			.flags = 0,
> diff --git a/include/jailhouse/cell-config.h b/include/jailhouse/cell-config.h
> index 66e13c3d..488e43f6 100644
> --- a/include/jailhouse/cell-config.h
> +++ b/include/jailhouse/cell-config.h
> @@ -178,6 +178,22 @@ struct jailhouse_pci_device {
>   
>   #define JAILHOUSE_PCICAPS_WRITE		0x0001
>   
> +#define PCI_CAP_ID_PM			0x01 /* Power Management */
> +#define PCI_CAP_ID_VPD			0x03 /* Vital Product Data */
> +#define PCI_CAP_ID_MSI			0x05 /* Message Signalled Interrupts */
> +#define PCI_CAP_ID_HT			0x08 /* HyperTransport */
> +#define PCI_CAP_ID_VNDR			0x09 /* Vendor-Specific */
> +#define PCI_CAP_ID_DBG			0x0A /* Debug port */
> +#define PCI_CAP_ID_SSVID		0x0D /* Bridge subsystem vendor/device ID */
> +#define PCI_CAP_ID_SECDEV		0x0F /* Secure Device */
> +#define PCI_CAP_ID_EXP			0x10 /* PCI Express */
> +#define PCI_CAP_ID_MSIX			0x11 /* MSI-X */
> +#define PCI_CAP_ID_SATA			0x12 /* SATA Data/Index Conf. */
> +#define PCI_CAP_ID_AF			0x13 /* PCI Advanced Features */
> +
> +#define PCI_EXT_CAP_ID_ERR		0x01 /* Advanced Error Reporting */
> +#define PCI_EXT_CAP_ID_DSN		0x03 /* Device Serial Number */
> +

It's better to move them into some include/jailhouse/pci_caps.h or pci_defs.h. 
That avoids, when doing a fast-forward to the last patch, that we may ever have 
to include cell-config.h when only the IDs are needed.

Jan

>   struct jailhouse_pci_capability {
>   	__u16 id;
>   	__u16 start;
> 

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/08e7bb21-24b1-0b9a-1644-f9793a28daf0%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
