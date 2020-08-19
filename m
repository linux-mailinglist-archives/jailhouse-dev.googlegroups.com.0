Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQHR6P4QKGQEPMRACVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x33d.google.com (mail-wm1-x33d.google.com [IPv6:2a00:1450:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 68C2D2499D2
	for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 12:02:41 +0200 (CEST)
Received: by mail-wm1-x33d.google.com with SMTP id s4sf836740wmh.1
        for <lists+jailhouse-dev@lfdr.de>; Wed, 19 Aug 2020 03:02:41 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597831361; cv=pass;
        d=google.com; s=arc-20160816;
        b=E6tvc6EVpmQS8StnriSRKZr3SKL7WVtIQyOzvqWxBXnWUN2q7kn2sIYmJ9sGXYOIqy
         lwZptreTIONnd5+qBN1ZtnDLiPJJ0f+lc+4UUHT/+HlzaBwlQJ01DTidlrJtLW78q5Jy
         6FXCjGElqOkYHbzOZWeTgt7J07rZJ74k4uQ22+1ipUohIrV3dmgU6YJH1EZVhHMBNz0l
         uaMsdXcikP3k/gYD9JgvwAbvancXs6gpeYYqKnows0tXxorsj4CS1n11UxnSUmTiH68J
         KEDAy9EK7lF5zUNSLmPGbz/1h8TRwxo4qMS4Jv+p9wtrPafN60gAM2UaLZGRVY+Q/VhY
         5GKQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=t2uPoP5iYPxunpDpgGHyfk9eE6GQ6ue710QtOHc99Vc=;
        b=oIm/RIChgOFORpXJU2/LEcpRGVbiMz7RsJVwNou1yHWndUFxQEH3hpKlkRaMcMjRCh
         hufh1raSuD/F9dRqyVxtSHzMphyZnVLoVrM3hh+MXisgxdx7j/qMsKKnxTPtorIK261V
         d365QTpn1EQaAca2EP4gwdH4UbASnLt2E2OuGiZw4qwqhCajSmXjSDj9Q2kKcqStBV0B
         sVI23QA/tCqK7G5ECzy1cXadDGG+5aRsbwcSPAmtHdiP0IrOryDksv1TvGDh+ODWAV2L
         6tbf7kESpI2GBzk6DX8b8VVtD49FbKxKZk3IDk4jG+nRFj0MppE5/XHsoR57UUzzR9uI
         LYHw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=t2uPoP5iYPxunpDpgGHyfk9eE6GQ6ue710QtOHc99Vc=;
        b=GE9jxYg0Dk8mR3RRYqXJt0k9je68IoeHcgf6ydZlNASg9ORo7cTfAm6SoOBSsQrCcc
         FaXSi/+0TxpXigc4LsXghzD9mxmGZ5eR0ucr2tmIruUIXoZgZORbCc3o+fyGMFgUeRuG
         xRLEBcSfTuae7ttUKCqHxZXz7/aluPik10tcVTeuJzOvDTWIcAUqWCBJuuZ/Kb5Jm9AI
         HOTs4NGI7u2mUA3QHziPT1RFUHwsBXg11rCYi5vvLvthvxByyzWzU554gC9iaL/8eLdI
         OuzW7nYe7VqwduA2SmiR4kWrQvxxEj48qsca7erQGy91BzwlQEQbr637t5PyJSMeNkuG
         x9AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=t2uPoP5iYPxunpDpgGHyfk9eE6GQ6ue710QtOHc99Vc=;
        b=mP5C9waQ7Rk7yjm9wloSPspxORoxLVUhdiGdJ4luDPd9uT7rSGEUL4Y8CqUkxfX5fJ
         d5GhKNhbmK8QA+NaH6KPIY6+3Fzd+MWa0MT/mJj5P8ldFyah5LQB6AxpGCeHFh7Eqy0w
         dni+y4EPbJabGsefyiQydRBNFxP5oOmZRwpuEz2+2ncP3CJK2IjmoJs4c0cM0k8ach2U
         jDPdvNXD2OeFFYilpfG5UVdq/SPrPZXMoqH3rp0Aq7u2ut/4bgo/H8gdovIxT3lqprZS
         FmJa7JcpJM7qyzgbkpHQEXq3lTYbVyGbran7h8turnmsHuVINNM3v87f94glYWCu5XLx
         99aA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532nCh0SXa3VuSWNfIGwKDK17hS1w7jplxtHlxAyN8akKDnhxOFM
	eG4GpbmOiWWo2K59fHaQD/g=
X-Google-Smtp-Source: ABdhPJxfg9xMdkmxSB0W+nJStZZ9lQZeyBWUgc3g/NeBztrm35ndvPaIk13kcmwI4mALIsWiY9OGWg==
X-Received: by 2002:a05:6000:11c1:: with SMTP id i1mr3541568wrx.277.1597831361054;
        Wed, 19 Aug 2020 03:02:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:b787:: with SMTP id h129ls1499423wmf.3.canary-gmail;
 Wed, 19 Aug 2020 03:02:40 -0700 (PDT)
X-Received: by 2002:a1c:5451:: with SMTP id p17mr4431504wmi.180.1597831360081;
        Wed, 19 Aug 2020 03:02:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597831360; cv=none;
        d=google.com; s=arc-20160816;
        b=vwclf6yorGnjFM8UvcEfnyu2ceajVGcvtcIiP3U8M6BfsxZXvaeCjcHyLahXd43RSO
         b7oazqAjVlszt5IqhwiZKmu/5atxuT3uODIDS5goR3lQ8+jgSlyOyny9kZIOZW8H1/B3
         FpNbl7Nt6UpgzgUFnO/+Pz+JoI09+9mnHOVCmi5O2bk+mNQuDdxx90QbvLeYO8PNzGOD
         VLAS5RYrZC5QbwW0VsShoM0DQhUngu7/xso4iYlVCFIX00/x5Ey3y8wcpVw/rASglBIl
         6XPVZKvmuwx0hI+oOtGK+496T5C0dMhsBRtFXabIWyCMyMkFekX1XYq5RpSYY/xr0BBb
         G9Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=6rb6IkDSexHx4clETdl4S/+plGnCy+GT5RWdni5SS1c=;
        b=Mke/OqJLQDdAXUAJZoNCiZ3vz7ENRuHtjmV2eMg9notXByHVZ7w3XEW45EN3eOEP0h
         gtkTmnNq+z9h6/kkz5AZBFu4wFNBY3PbEV/iFNipf0ivu4NrVEPKLYvGni/xgona5fNe
         YkVey17wBWpf9vlKM5IwCdGUuXHLUZuOWUqmhAG+M/WDV/KpJTi/xayaRY9l7idGQhsj
         9DOwrSnURAVAyxQKTaQ08zkqX9INA6NNvGRchNcyPmQYP/tkO2PbWAYnwPka5KxF3tha
         3LZIxMZrGlG9lUCF49UaRJ4jrPJP8OVcCHydPa/gF18BoP1HoGYkPfoCvHmqzMRC2A1O
         v6Sg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from gecko.sbs.de (gecko.sbs.de. [194.138.37.40])
        by gmr-mx.google.com with ESMTPS id m3si121203wme.0.2020.08.19.03.02.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 03:02:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as permitted sender) client-ip=194.138.37.40;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by gecko.sbs.de (8.15.2/8.15.2) with ESMTPS id 07JA2cCW024089
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 12:02:38 +0200
Received: from [167.87.31.209] ([167.87.31.209])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 07JA2bao020690;
	Wed, 19 Aug 2020 12:02:38 +0200
Subject: Re: Starting jailhouse on real hardware without QEMU
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <cf0c959a-a862-4ef3-80c9-2037c88fad45o@googlegroups.com>
 <ce8b7368-3da1-fc89-d1ea-628b25bec62d@siemens.com>
 <ee6a7e80-c88f-4044-9cf9-209aa0fc8d61o@googlegroups.com>
 <ce82e02e-1b8c-4979-9b3f-8ab0161e067co@googlegroups.com>
 <6e9595aa-ae7e-8808-9335-29dbe7345ad6@siemens.com>
 <df0e6993-5f54-4d99-95f6-b3a36ce677d1o@googlegroups.com>
 <5775d148-cd2c-6764-9242-e1742bc018a6@siemens.com>
 <f2264785-a575-42ab-b129-343085d8bdcen@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9493a53c-0de9-eb96-1158-0a0922f70910@siemens.com>
Date: Wed, 19 Aug 2020 12:02:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <f2264785-a575-42ab-b129-343085d8bdcen@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.40 as
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

On 18.08.20 12:07, Jan-Marc Stranz wrote:
> I have now made a few calls to the command "sudo jailhouse enable
> $HOME/Projects/Jailhouse/jailhouse.git /configs /x86/sysconfig.cell".
> Every time the whole Linux PC freezes.
> The messages that are output via the COM interface show the following:
> 
> ...
> Page pool usage after late setup: mem 359/978, remap 16517/131072
> FATAL: Invalid MMIO/RAM write, addr: 0x00000000feb82008 size: 4

That access is on the AMD IOMMU. Make sure to disable its driver in the
kernel.

> RIP: 0xffffffffa14f3bb6 RSP: 0xffffb551c02a0cf0 FLAGS: 2
> RAX: 0xffffb551c0080000 RBX: 0x0000000000000001 RCX: 0x000000003000000b
> RDX: 0xffff97694adc0000 RSI: 0x3000000b00000000 RDI: 0x7ffffffffffff003
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x00000003cca84000 CR4: 0x00000000003406e0
> EFER: 0x0000000000001d01
> Parking CPU 5 (Cell: "RootCell")
> ...
> 
> or mostly
> 
> ...
> Page pool usage after late setup: mem 359/978, remap 16517/131072
> FATAL: Invalid PIO read, port: 1771 size: 1
> RIP: 0xffffffff9d8f5f48 RSP: 0xffffb84900127dd8 FLAGS: 93
> RAX: 0x0000000000000000 RBX: 0x0000000000000002 RCX: 0x0000000000000068
> RDX: 0x0000000000001771 RSI: 0xffffffff9e568b80 RDI: 0xffff898449e90498
> CS: 10 BASE: 0x0000000000000000 AR-BYTES: 29b EFER.LMA 1
> CR0: 0x0000000080050033 CR3: 0x00000003d7c1e000 CR4: 0x00000000003406e0
> EFER: 0x0000000000001d01
> Parking CPU 1 (Cell: "RootCell")
> ...
> 
> I've attached the system configuration and 4 log files.
> 
> What should be changed in the system configuration?
> Port 1771 (0x06eb) is actually not used in the system configuration, is it?

The port is actually 0x1771, i.e. hex. The quick solution is to add a
PIO_RANGE for it (and for similar ones) to your config. If you want to
understand where it comes from and when it's not listed in /proc/ioports
(likely), you can use CONFIG_CRASH_CELL_ON_PANIC and study the backtrace
that the kernel will then dump on the violation.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/9493a53c-0de9-eb96-1158-0a0922f70910%40siemens.com.
