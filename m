Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBWPLW77AKGQEZ3K3I4Y@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x538.google.com (mail-ed1-x538.google.com [IPv6:2a00:1450:4864:20::538])
	by mail.lfdr.de (Postfix) with ESMTPS id CFED72D0D01
	for <lists+jailhouse-dev@lfdr.de>; Mon,  7 Dec 2020 10:28:57 +0100 (CET)
Received: by mail-ed1-x538.google.com with SMTP id bo22sf516324edb.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 07 Dec 2020 01:28:57 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1607333337; cv=pass;
        d=google.com; s=arc-20160816;
        b=pl8X52wQoQNFC7UgPd1G9oLaLjJqHk9sCq7/UUqwP+MVKPNbRmeYocOaqbDbGwW4gh
         7vWjDyZ0qqc4p8yKt6natP04tNMdmkwff+K3C+s3uWnN8njOfDXf1EG6Ullvjf0sbO1c
         J11tjoK5mctSuqJS/2PLozrAwkxO+1hEtyC3PwmlWPuZS1zvBg3tkJ3ddPEzykZItBmG
         L6/V00ligBeH2Hr28Bk80rjvvdDLKApsumqIfNDRAWVgCV85Y60dnrONqudLGlvFqGyg
         sRvVsqb2dFsm84H9l5DRccpqTOsoBul/czFhp65FuXeQefWnICNIe6DczWNuH7IYAj3u
         v+xA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=l6Jm9oSambJnvHwHk8M3B4unDP6l+wqfY9jDrJi8v0w=;
        b=ZG7ieWt//rQtNlXoME65w2ZXFpkbYOpFNc+nuBfJ6u1x0VxDBvHdsQdpR/kNd1nM4Q
         6EzWx99PPoRLoR/+3Wcck+PYZXXu2on7ocnaplMnMAz4iJtYRrTcyLMUfX6LZgHomZdg
         zh27/r2rKS0rBDDd5zej+87ErPR6BHDXDxTcHtcgx3neSwxWOWr/0FVGBLaYrec1KG5b
         5eTiqG8N9TkK5zksmAHn5lbX+QqqeRSY05I+aAWapWMi8H4jZfArkNpZdWmnc/jBXBey
         y7yveU8NUJ9SCd0MXA7Uu2kTdGKU3kDV/UnVPGU5UtSrYUIDwPtgUc4JoejK4+oH8nqO
         gmcQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=l6Jm9oSambJnvHwHk8M3B4unDP6l+wqfY9jDrJi8v0w=;
        b=MnPat0vrDDvrOBtak1SWGDsW4GIkmpE7LXFanl1dQoGbHdtnBlCEe07ceWB57Ia0Wo
         m9QKyBdlnJK56H5La8x1bOTHkbcxAsCEpkCKwrGy1k6WuB05YrmHJRh2xa0tvhX8c+ps
         lmE2MSP9UI9/ZrjxVHk7OnYY01a0Iv6xNCR5fcfbjG+Prbl8fiC4lU9l8QTpupqYrzBL
         kADVb37d9Ge63+3etjiiQGi2kYiK+iVvduY6SkBzGLjDiUXCo+Bc5pJgwSLLTRD+Gg2f
         S8wtyUyoie32EGwnIg1mDmCxfWmcaSJCYcCaGKu1JpLBJz4xFaoIh+7tU9u30tLu4kX7
         kodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=l6Jm9oSambJnvHwHk8M3B4unDP6l+wqfY9jDrJi8v0w=;
        b=gT66TVjXB3gD50qH5NGWq5kCIbPViSo327fIwpPATEEw93U6nyRSzzgwI5MYZo9qfh
         tN4zgfafMmDMKdqcXnNxYAuy00BZCZ2Rdwsj/mf3Kv7x0LTW4B3YWCLJGB12cNUIlydp
         eKVGvasbpNS08/1wdW9iaGSTNTno0ISlogYJ0W4CbUDvDhyySLdSh0tYXTOIUvVxZoL1
         QTUTMN8ybKc0NZruxWPFsVvUL6VqPe2rKSivNmcCL5kta4QgfD5ZZHvrNzbMV7Arnc7e
         vGQzvZnsggMOPyyMVvnrl3m/EdAdLBrb75rvU/Kbmw14HTN33+VG8LibnhUBtMbQrEqm
         Opqw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532JnoM1JIIgJHfdE/iMPYFeviLYkwOoruoYOwVuMlcC68eJNq2p
	s8z5H5ksJgfAuhSuI/2qrTY=
X-Google-Smtp-Source: ABdhPJzcazG8kGKsR4d+oO5HIdOSjV3kxbBFbZvFSNYGPBFEwGWUsBLeB7hUNnyFFYizIaxZpocmYA==
X-Received: by 2002:a17:906:b7d6:: with SMTP id fy22mr18159550ejb.219.1607333337535;
        Mon, 07 Dec 2020 01:28:57 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:906:7c4c:: with SMTP id g12ls7349171ejp.11.gmail; Mon,
 07 Dec 2020 01:28:56 -0800 (PST)
X-Received: by 2002:a17:906:68c4:: with SMTP id y4mr18529468ejr.332.1607333336442;
        Mon, 07 Dec 2020 01:28:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607333336; cv=none;
        d=google.com; s=arc-20160816;
        b=WtQUp9hYeZcwYxeCi2F7XuK2QKfiwkJMcblJpz3Qav0iKnvIC1c4LgtHER5xpRDXvK
         RxIFjuRqyIq6mcZPGaYxTqweoFeYtK9pYGJ5d5ORgWF7pLeQItv07rIpgAkEirqLuJ1W
         FATYNBT1jCt5u6WnIhSHQ4qn6V8UmuWFRP04BAB+mosbV+9rW0OIgK0ci7iccQ2wSUwy
         vA3PTYVV0HEsJaftAW76UwlYJNN0lMeKYpP2LUMnIgLFbcA8NhVZPgrO3RhQRTLZN59V
         juR2Vli5sHJ2jIyBcebkXVt/TqixJAdhhClN9uvPcGp82DYfW0kCRpscGlRSqsNlsKrM
         aaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=0w2rrqC1eugCu7QBp71iumhrbwOhdQSOiRxjgEupJPQ=;
        b=DbtPffx7kTJj4l70kP17CoYCsb6sIyPiuFPw1alPpStFtCAQvj59tKzfsBZRY6+IB3
         LfYCeNzDeiIQekHkbk856oRG04L/j1aRWQEeMdLsRc7plh+jLKxGqEY0Kquc5m6iUVPL
         ux7Wa3EaWYRIqB4dTYQNIlPN2jlItUhI3EESs0lJxB8mHxwsLvH0n4l9jArZbYWqnJ1U
         Hop5Dx9ofTRdz19zW3AFgnJNcD/JMX0coF/ju7rd7HNSABkVWnAgwGCuwGYKSkaITvgk
         PL1DV47b+xJ7TUVQJq7ip9eUzXyhDnWU80L9wDL2zYfHX9hdZv5Bx+GVOEdaGiNMTIjS
         dYiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id f26si475455ejx.0.2020.12.07.01.28.56
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 07 Dec 2020 01:28:56 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 0B79StxE018730
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 7 Dec 2020 10:28:55 +0100
Received: from [167.87.36.107] ([167.87.36.107])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 0B79StRT022970;
	Mon, 7 Dec 2020 10:28:55 +0100
Subject: Re: ARM64 MSIX enabling error
To: Peng Fan <peng.fan@nxp.com>,
        "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>
References: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <3bbd059e-632b-da36-1f79-de1731e1352e@siemens.com>
Date: Mon, 7 Dec 2020 10:28:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2760E09A5E40B4818663E07D88CE0@DB6PR0402MB2760.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 07.12.20 08:46, Peng Fan wrote:
> Hi,
> 
> I use MSIX, not INTX in root cell file, but always met the following error.
> uio_ivshmem: probe of 0001:00:00.0 failed with error -28
> 
> 
> I am trying virtio ivshmem on my board, but seems virtio ivshmem
> vi_find_vqs not work with INTX, so I change to MSIX to see how.
> But met upper error, any suggestions?

MSI-X for virtual devices only works when injecting them into a physical
PCI bus which is using MSI-X already. Is that the case here? If not, you
need to debug the INTx case.

Jan

-- 
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/3bbd059e-632b-da36-1f79-de1731e1352e%40siemens.com.
