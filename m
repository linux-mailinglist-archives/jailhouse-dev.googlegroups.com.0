Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQMV5D5AKGQE3XVQFTI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 820E226453E
	for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Sep 2020 13:15:14 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id o13sf2103148ljp.18
        for <lists+jailhouse-dev@lfdr.de>; Thu, 10 Sep 2020 04:15:14 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1599736514; cv=pass;
        d=google.com; s=arc-20160816;
        b=lHdVOkewc7Fjtt5iK3W+frFfqSDQdGYCHNj43Cy6H9335b91KZ1EUbUDN2jTFAuWvM
         fvalrYLuaGVKWhDMgTyW1Gad/xnSUeq+cAIEjXHNjiLLCJHcvpNw7LBn3xIgomeaI8VW
         Ay61Q6J3utJzeehFivNx62jLwkCwJ8n2zN58y7EfWGIJzL1OGqz6gcvF8LHHeUohlpFT
         btb5TnryfQrWCcIVmDEbRjmgfNzdEYOmHbjw231mLJ1ZLbiyw5ifEr4oZWu1Fry7c2Gd
         DIPk4u1QlUTcntohMahT7KyteTqzPoZF+bTuh6eoo0I/38pYDqlLjicbHpc7USt02BPm
         Rnxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=OxsqusgnQfDD9kCuWTHsnGDjzhf4eTH9+NlfqksBzJQ=;
        b=02g1y5Q0VT8oElFoD2Ib/KoXFc6MBm/pSfQ3UBR/oCQMY2CMBZBT2yRMp7mr0pZ2AK
         CvOA8DoYNLMJgJ1OQ1DPE/olje41yZPHTuXJJe5Hs98uk8n3D9vF50uJ15kQ8NOrfMXv
         UGuGYS+bQwnF7rr3yBhxAlIGGi4n6Uz5uL9cS32EpnqXRMoot1FWzC9Ttmsj9P65K0Sw
         WRVSymXrZJUX5LXWk4Af0pF2jLwM7RWA6aBryM9GmDNUeaiqqPmgWjj8/P+1cYMWuEZn
         agatRnN9WBJJIB/0QA4z1Bbl3RZwdZKDf/HgnaZHEKPh2FoukiBFDDboUKt7U53XotWy
         epiw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=OxsqusgnQfDD9kCuWTHsnGDjzhf4eTH9+NlfqksBzJQ=;
        b=JIACWlEfpCBktsbweh2wZtsam6LK6sCk+1PdHGBmVBQavuYFErKfEpGSDW5I1hzn4C
         8X/t6nzNhGzq5ZmHtkuLTXpKdXScHFpmbyJuC2jW7V4E2h+/pwRU7idff79/ksj+wHTs
         /XfpHe/9ZD8LTBCZ4C7Mk7hWmner3GJST4w6L0HGFe0JvaC6p3WjR0qRFwhK3aWsxTsE
         SoGPGU3xr3RQtYbBfKRna4yJmQzr7tde8jGlP3UZWB8Lpub4Wr+0EkSVaOg8P52h2gH3
         HfPL6aA5215qiYhVCc1lBft5UvjUX8xQLsSK2zLARPtwkh54WIjRp4E4hNqLBnlXYGIv
         ZE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=OxsqusgnQfDD9kCuWTHsnGDjzhf4eTH9+NlfqksBzJQ=;
        b=dxtojBSOpKGJwyi/cPe2TGvgLgZbVw66r5mm4je8N5tWkYNDx9z7cqjmhKbEBg1+RK
         KqCmib0eyXNAkJoVEI1VpjL0s/ogKgTXm5dAZPz5Lg6ZPZCE51oMhzlnVhijYY3MOntV
         CoKhk1KEGW9Q5A2MQYU1lqaorQ1xeucZbXFCQ3ucFa/9ZUJh0e/ZF1mA5moqrZMeXLo8
         pH+dOiBc8KJtbHa4+19BvPVkpSlKuwn6wrXyxdGafaka8dHKUC8mSFR1URMvZkcKtVLC
         SaBfYwB7wwU0fCQrhi0xvrmizuOs0UPbkf016+6zuc4roM3zc6JCvxj4DYqspQQMnAN0
         2Dnw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530NqdqjNRwMFz4ygP+b35SH9KxV7075WCOPXMkC/OyedFkUt5Xc
	OLU7lEISv1hv+cMR5vAakXs=
X-Google-Smtp-Source: ABdhPJyN5S7/+4dBN6tzd3YsY55dYYWjTIkuf156kM2MeigW/DwUmN6Xb1I5TR9sQb0AL0uZfNiR/Q==
X-Received: by 2002:a2e:541c:: with SMTP id i28mr4251810ljb.77.1599736513945;
        Thu, 10 Sep 2020 04:15:13 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:6e4d:: with SMTP id q13ls977252lfk.1.gmail; Thu, 10 Sep
 2020 04:15:12 -0700 (PDT)
X-Received: by 2002:ac2:5599:: with SMTP id v25mr4037007lfg.129.1599736512629;
        Thu, 10 Sep 2020 04:15:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1599736512; cv=none;
        d=google.com; s=arc-20160816;
        b=AKAQFFqe02Y9HE0XtmGDoLOCx9RpoviR4hmJAKEKDsWXyeuQ7BCeH6OMTPSWNwR3X6
         hIKz5Dz6QkcfePGRmob16ZNY/+zpz1p7In9/sZuQ1YH3hmpAGiXzO1k9xyYEd0JwYkd/
         P5sOImnP0pSJisszVENE4+iu9vKU6wUkoAvQUl08cD6ML0JikNW8nJwoNI+gPs4HLQ9a
         T48FPG2JndOCpdOVM1KXqjaAWwx6tTb5fVUhvrAi9yAngV54NkLKiDxcRAxxtf2/k4Bx
         G04sudWAKiUDWMX4ejfUbPP+uRYqgAJiFFUIInIovaunH1zlPO4XauLhEMYUkFcgqbsb
         sxtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=Z+r/XT8Q+ZTtxB+wm8JsbPETvDRcLxb7n/wOp6DGQEI=;
        b=al42snxx8Q7EKqv7ozWPIOBbUQzzIFTPymN6g/tQjjb+8WZVSrVYMEHDuKm6NE2bzv
         6z6aReeN5s6VgenVPaIGURHMSwEkjMNCU8yCb9/8Ot8z1zT3BGmckGiNdO5Kzz5DgHhS
         caihn8R9g5BF16Xf63zsl8gX/KoqTxXZiW2ePSMjE/WwAyGDhhe9juCW5OAWLMPmg6Xi
         UpM3hBPSpRubD7F/hGg0Z0sG3Sv8/ZRm2Q3sbndEC6BtRaf++BP6l+3/gd5RRZwZTJlG
         0lySoLL/CB4LtBG3C5BEAv9bPRInqZk+ApBhZ6xZZkx/HoaVLhh5sUfb6F/xRS2RkkNP
         GB3g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y17si162298lfg.2.2020.09.10.04.15.12
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 10 Sep 2020 04:15:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 08ABFAl6014330
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 10 Sep 2020 13:15:10 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08ABF9PN031906;
	Thu, 10 Sep 2020 13:15:09 +0200
Subject: Re: Build jailhouse on embedded target
To: Jan-Marc Stranz <stranzjanmarc@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
 <992cd8fe-ef09-d0bc-119d-e488de158759@siemens.com>
 <c5f91e66-7742-4736-83fc-8565b08989d5n@googlegroups.com>
 <1776338.qqhLftCfjJ@monster>
 <33ee04f7-5518-4f30-b28d-fb567ef1c609n@googlegroups.com>
 <0845ad7a-09a3-c366-91c3-b4f1b6725c56@siemens.com>
 <618bbad6-8276-476b-934e-ea765b28a796n@googlegroups.com>
 <0f3281b7-5da9-d616-d7ba-775ae1593e0b@siemens.com>
 <9dd555de-385b-429e-827c-408cbc04122fn@googlegroups.com>
 <42b8fa41-88cc-4907-bdce-44474b98d8acn@googlegroups.com>
 <8fc62bd6-478d-9725-ca0b-949f6e9217db@siemens.com>
 <ed7b0bc6-953a-4449-b77e-3d8b2db84e94n@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <313b5c57-f64d-17dd-28ab-39af5b9058cb@siemens.com>
Date: Thu, 10 Sep 2020 13:15:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <ed7b0bc6-953a-4449-b77e-3d8b2db84e94n@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 10.09.20 11:10, Jan-Marc Stranz wrote:
> Thank you for the answer.
> 
> The Intel NUC8i7 apparently has no UART at all.
> 
> I have another target available.
> There is a UART (/dev/ttyS0).
> 
> However, "dmesg | grep ttyS" gives me the following:
> dw-apb-uart.0: ttyS0 at MMIO 0x9131e000 (irq = 43, base_baud = 115200)
> is a 16550A
> 
> This doesn't seem to be a "legacy UART" with an "normal" I/O port.
> Can such a UART jailhouse also use?
> 

In principle, yes. Documentation/debug-output.md tells you how:
JAILHOUSE_CON_TYPE_8250, JAILHOUSE_CON_ACCESS_MMIO, and you may have to
try both JAILHOUSE_CON_REGDIST_1 and JAILHOUSE_CON_REGDIST_4 to see
which one is needed.

Only if the UART requires some magic enabling dance via other resources,
this would not work.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/313b5c57-f64d-17dd-28ab-39af5b9058cb%40siemens.com.
