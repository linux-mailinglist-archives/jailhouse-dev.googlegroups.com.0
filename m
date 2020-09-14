Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5NC735AKGQE5EAHGGI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B882690A2
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Sep 2020 17:51:17 +0200 (CEST)
Received: by mail-lj1-x239.google.com with SMTP id x24sf1414456ljh.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Sep 2020 08:51:17 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1600098677; cv=pass;
        d=google.com; s=arc-20160816;
        b=okqXuGcPhefE+vWXR9cDNa4lVKIdhEFmlUmDLDtXek3j1I26OaPdKT4iAbRRhTDmty
         990Rc4j21G1R6JOlb9D9oy3+zuup8EdtGm5m9vAgKk7Fz3XiDbF/sI8+L49CWjufZrdR
         StUlmjK3R2B6YUb0tOWXR/1svUMRjZwIoB5EnXwTdZrPu6NyucU5xu4SDkVIEZpLFr2w
         XWzNXpgfATgtLYWnqJoNDOwzSahipaPt/JhoB41ViokWKEHKEvMn9x8GuRQeoLaWPF93
         Tgu8qNH3uXGuQhqFVC1odolNMIlj+BUx3vHQGGRjI5UZ6zi2aK95dvTw7++0fVlIT4nL
         2elA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:to:subject
         :sender:dkim-signature;
        bh=h6xnss+tma6eD4TWQHgNjrllNCT6evUYqd/Pe5EqAAE=;
        b=GhBcvBAcbYqcJfwh5cdaESJqKCx9ABG7SmYC3wfKpe+voIhsDyzPcoOp7vD7UCMNyE
         evvyjCR9D+Sd5pfUVC1whfqwwYSpSDfm0jLWfsoifoOsyRO2uYeb6GvsXWcESTy2RS8H
         sqh3VA92m/l2uxIToQx7PixueatE1NHb2SkWqTt4+mqlQMP3cy47MnzIpUcmwXI5cPcJ
         V2Xr+KDqVW/hA61v4O3uykEko6QtoB63PLKtPY9EQg6jfNHbTgPEPQv/y3v38b0GCoNN
         7QeMd2gP8of+THhWRC/Hlfi63/1PaHZkCiWeFvICdUe20CZxgDxkzovOZhw7oxARKTZp
         /GQQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=h6xnss+tma6eD4TWQHgNjrllNCT6evUYqd/Pe5EqAAE=;
        b=nliwkfu6i6K8YGOv/b/SewQJn7cspcbgAeerOXoq+tuqx1S59OLzg+rec5kbHZ/h4e
         /09rO1dPu7njxUalGq04CqoVqIhlQQ+KKPJdmLjP4BJ1nPFY6WYhTK31ATNrOmKx8IOX
         EsVIOrC1qbzQIHinIOvFSD5GYiiYfidZOF9+jMwh5HDEqPYfk4oDYJtPxIJckRaBROFS
         FOh9LN1272jM/iYMNOa2f6lYfr8rwDVHaA/cb6HFcp174XiKGK+gzD9mOiEhclF5jGNn
         awPiNvKThGuFkrxA0QSQS8H7WaSB3p5hBhZkcqis+Z5xokB/BoQjvWXG+lMC3oRRphaD
         TZJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=h6xnss+tma6eD4TWQHgNjrllNCT6evUYqd/Pe5EqAAE=;
        b=Kyrd/pU/iOLBm7YPyMaVtrh2gioTk06fjjccxv7hEnvefJn95BHTxNI5DaU/+nsjZW
         Abr0ram3rT5lUXKfCfRZdkuIX9ls/OIzkkd/pHAShBKMIJtztN22BZecU1kSpvIJ0QP4
         665Tqg3RVVeHkdCOkkN7wbH/yKUGb8w6dVgGDebSaNeiSWgO/CI8yQ6ajHhUhfdbyOxk
         ho5/A5z2Zxhw/nB4Zifbpdnh3xwcDoJY1qdJWuhsqKO8NkVNqqHnDOmsu6kF8nIqTqKy
         ADQzQc6g9gYWQ09Qa7AYZiVTjqh+DJnRJkKviP5JBVYxWwS4tfLAd9k0gtCJXgljRKL/
         BBOA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533EbptVcpJsPfZfI8YS15mhQy0Zv1bM5uuoyIqNfjRfyht+PIAY
	9Cyfni5Zl1VP8orwZmIrxpI=
X-Google-Smtp-Source: ABdhPJwEmzALemAl2oX5aOIIKCCHUgu9zsGuh/2TBnNMjAswOmq7TcBE3DRs4l57zkX/1ELKm+hNlg==
X-Received: by 2002:a19:7b14:: with SMTP id w20mr4866556lfc.563.1600098677485;
        Mon, 14 Sep 2020 08:51:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:651c:555:: with SMTP id q21ls1469635ljp.3.gmail; Mon, 14
 Sep 2020 08:51:16 -0700 (PDT)
X-Received: by 2002:a2e:9743:: with SMTP id f3mr5817914ljj.310.1600098676092;
        Mon, 14 Sep 2020 08:51:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600098676; cv=none;
        d=google.com; s=arc-20160816;
        b=zDcQQVZ1Y8aF7o/72oHYVz68NK+lvbBTCjoQL7Yb/WMSCnlcv2mUUDIhiU6ARr+oex
         tIYth5T7DktyWhMlyntLSfFmAyAHnNHDx1q0tOAREmC8cP+VHYfD6EHTLNdhPzrS8tan
         aq3pEB0HGj6AiNWICFEBVM/L1lQ1T1Pif5CE8+3WBxzwbf168GlvZfm4EskEohLgUo2/
         Skc2Ze1UggWGwl21HFrYPz3lZ5WZRe9iMaEm8w9mPVT3Z8lPGh+32Bg8hro0uslrxwB8
         9c0OUlWVUo0ImqW/WYalHABaFK9AYGbOE8OroX80HzvByBLSGLm4yQycJvQxRbJAfzTd
         ytMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=NTkW8PH1Cd4kv9Cq4O0SA82EdldCcV0dkm6LHc7j8X4=;
        b=e/r825cGEEOVQxUzM2YfP6oFFFr5fHbupQgfGOB9kA4GfryOK3of5n5GYo9c6EtC3g
         x4A03b3oz7LspihTHTVF3Es4Woq8FIKPSU8kyHmbnmm8oak9RdBsSat5wv9+SVzA9VzK
         J8gkbuBBAFzc5CQiGVuu9GrfaOojMYSkHnccs7xlUGJNr9tL5eVrAR/qlG0oNbTXh4Ks
         xFG8htABWQPtBUqBg1wqnN8ITQUfHGnPb/Ap8QpZbERSEn3Pn2sGWyujx7wqSzuFZX/O
         TVuw8mJAw7CujVPX8nhJPJc4G++1jNJWMdlrBTEq7+EhCudxpTog6HYag79c0KcEwPBi
         gAdw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id y17si342757lfg.2.2020.09.14.08.51.15
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Sep 2020 08:51:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 08EFpEWG032011
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 14 Sep 2020 17:51:14 +0200
Received: from [139.22.115.152] ([139.22.115.152])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 08EFpDe0004242;
	Mon, 14 Sep 2020 17:51:14 +0200
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
 <313b5c57-f64d-17dd-28ab-39af5b9058cb@siemens.com>
 <3752cf4d-64e6-4e55-b40d-08800a689f0an@googlegroups.com>
 <c9c32f69-572f-8224-8a10-e0922d7374bc@siemens.com>
 <ec528e54-0acc-494c-95f7-314d6388d4aan@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a7f234a1-f0d4-0f3e-3d12-98b8d63e688e@siemens.com>
Date: Mon, 14 Sep 2020 17:51:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <ec528e54-0acc-494c-95f7-314d6388d4aan@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 13.09.20 19:05, Jan-Marc Stranz wrote:
> Hello Jan!
> 
> I work in a company in Austria (Vorarlberg).
> We develop and manufacture industrial measurement technology and I am 
> currently using Linux together with RTAI to meet certain real-time 
> requirements.
> 
> I am very interested in replacing RTAI and realizing the real-time 
> applications on isolated cores of a multi-core CPU.
> For this reason I came across the - very interesting approach - of the 
> hypervisor "Jailhouse".
> 
> I am not a Linux kernel developer; however, I am able to create my own 
> Linux distribution with the help of Yocto.
> 
> In this forum I have already reported about my numerous problems and 
> pitfalls I encountered while running "Jaulhouse" on a real embedded target.
> 
> Asked directly: would it be possible to meet personally and start up the 
> hypervisor "Jailhouse" on an embedded target during a training session?
> 

I'll contact you directly on that.

Jan

-- 
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a7f234a1-f0d4-0f3e-3d12-98b8d63e688e%40siemens.com.
