Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7GHSDUQKGQE5XRYAKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23e.google.com (mail-lj1-x23e.google.com [IPv6:2a00:1450:4864:20::23e])
	by mail.lfdr.de (Postfix) with ESMTPS id 0306B62FE4
	for <lists+jailhouse-dev@lfdr.de>; Tue,  9 Jul 2019 07:19:57 +0200 (CEST)
Received: by mail-lj1-x23e.google.com with SMTP id j22sf4217573ljb.16
        for <lists+jailhouse-dev@lfdr.de>; Mon, 08 Jul 2019 22:19:56 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1562649596; cv=pass;
        d=google.com; s=arc-20160816;
        b=pc40PXoOMwZYTgPpcC2ODtDBl0MO0AF2zcG5sYJwJf8gjdOdOPDwPSILzoTBoTGrwU
         5Wf5DhsVQSqghQ+0V7t3nvOj/VT2sMrY+F7FhgQTmq5smZMM7c7ELK9iQSG1GJvtcokY
         +Byw0BC0GgnCPzBl97m2rgo0Bj8Mf2/oaK8np3C0TlmGFApxEmoI6NrQMACSzWOqb10o
         b4Y6j2Y6U5iMpmFWEeA78Th6IWk8DYVlCQkNbVRkDs3LJpSIHlZNDFe24fqB5eaHLu4w
         lUC0OQhS/q11yu1PgsqD8Z1fSXMK8muDYtehNumgc4yQPnB7WkN0SjXrlGBV7Hl7ImJF
         /UyA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=mlAvNnLKVJqK6RY1N6L1v/VSFShjcZL+WFG5mi5Sjqc=;
        b=J6wRbgEi8lqADSENPalegRdiHI//jNJqiGo6+Kafhm6pCGfdRbP6cmiQiEz43eBcMm
         Q2sLfI1qGLUWafbZMV+erU3dYvSIXyaQsnuN3Z81Mgp8dx+JSwOiNJoq31HHDBVjLf6a
         V9Cr/z6Ahgx1Xhm1h8TQjOLx8b6rRaPrBkuAJx02UO1xl2cmefcSNAi1FaV4KoAIuuLM
         ApVRa39l7JVm8j15HO6/6ObcK+vidt4g/T2/Cz4IAbkR8mTHCcjdkoUb2GYT56iMxyHV
         kBM6xE9PG2NzeXJVnr7ef2DsmNa/Aq+Oxu0sNdiOQqPgC/GAlHhjYSArRHZmVnrwYr1Q
         JgLw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mlAvNnLKVJqK6RY1N6L1v/VSFShjcZL+WFG5mi5Sjqc=;
        b=hPGsZY/UD0/pWfEcfxyi0xsjG6swcLtuQYlBeUg896GJnVRQgzJ8Z5VUrGu1tni1Xo
         rojTny34pQWWlkF3k2DH2p1MGOUoxd/Hwrku176RgfakGkTeVN6Rq5cFw1ahEP3Lytq0
         0NcmUILMUhzh9tyhwsrkhS+2a3vlBBsp+I+wAUPg8EcTeGFENJuSrH0xhhwVl/9YAf7s
         /qbzpyKh+A8rtFcDKvuixzA5c0Uf3GOnk6N+gIuKkGs3GJmbrqL46ofj2hhS2T+YpXza
         oNJT0JQdlJYmRH9InqvvMX8phnzRqFr9SBPUmopKyGLf2XosnykZV0dHJXIKODRQ2d6p
         bZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=mlAvNnLKVJqK6RY1N6L1v/VSFShjcZL+WFG5mi5Sjqc=;
        b=Q1uIKBlumyLwibTJS+X2FBjVlpZ43RMqQL4kixK0waXxz+ZEUZn5Hh7qp9bc+tgDKx
         MDfaq3jy3h692I1E7NB2pW5NBX0D2hiAT1LaI2BGrrNZUf//J8djwSZ2rS+AgkF8/haJ
         h4IUwei6YFwPcehe8BWM26bpUFmBgERi3oxBzMn8/hNXfwh6EqC93CtFA+iKkKRQ1kRn
         kFIcho+bE3DEbqBNO/xW0EbZTBpbGlrngFv1ktXUboVnFPfrcIf3qJOd3mOjT+5nJmzT
         r2aGZfIJF7yYIcBsbz20eWXC2HRDrBjpCzef4ZwLd0E9d28VnRnbxjKXcKznpJAxDtiR
         iYxg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVtDU6yFpQQAdZQkR8B3c37oJAzm8R6W0UjsnMkkF0CcoqrhMHt
	oxBwTeKsh5ctQ24462eHbFk=
X-Google-Smtp-Source: APXvYqzSfG5srFDcBLvGxqCSQ3FoOkJlUkE06DeRIB/g7xSle6fNBEe+I3z1UgwXwjLj0Tq5ee1doQ==
X-Received: by 2002:a2e:9dd7:: with SMTP id x23mr1142860ljj.160.1562649596514;
        Mon, 08 Jul 2019 22:19:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6556:: with SMTP id z83ls2124438ljb.11.gmail; Mon, 08
 Jul 2019 22:19:55 -0700 (PDT)
X-Received: by 2002:a2e:89d0:: with SMTP id c16mr12342251ljk.219.1562649595903;
        Mon, 08 Jul 2019 22:19:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562649595; cv=none;
        d=google.com; s=arc-20160816;
        b=egPQIONpjFMQJGrs+hZw/wNQ4JsvYu0eb6mpwO/dabavr4e1wm+4wwCGkS2dHJXDx3
         cjFuxjE5Arhk5lNR594LhG6+H/byi2VU6YoRJe9u8XgQNAC/B4VrrruZd7P/xDh9gcP5
         brl1yFw2ytYPdN2xdjtbL1Fo8Yttwg1pjCJcU31VUXEHVvgXyNOy0dY4XWHrtoechPMn
         rv+upwcul50MPZf2Fpifi0xCG9PIvaXjH9FYEkydyiQLnEM1z0jPc/7PvQY2fauYChT2
         +YSm4D2Rv0A50zdZY9zkDu1UPBEwQF7qddfVgGtZKgRPIwHuF6gvAB96UwGdEZhyuN6d
         GN3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=c0m1I6rP3Okueg/pHlKIpkVYlHmoVRyp0wxkzyV6Xso=;
        b=iznUuzpyBwRUi2o6bd2mHOkKCE/hNlv193t1bzMbivvCjtoIQbbWTS6n/s31g6V3vA
         VKDsU5dK4trNBoE9ESDGjYm1ZBm1Ox/nt/nlwOzRzC7m03S2608lVdnLxC6TG/3lcsR7
         sb8dIwPuZ+zQhkvZ/OjQnEKSgc+aNMSfSYxF0Y5nE/PfXuKrVZ50GMlf9+h4RnLVFBoC
         K4fu8IEcC6jDq7G0nUxfjs1DIEpuQT/rZC6YNl68vO1EGbo6EQGxuYONb2esnbOl78fn
         8nC5KDppKPY33lufDvCV7Jgl/TIbRhiY7SQDHzoioHEnF81Fc0U8D2/JUqYGzbM7F07O
         yHKQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id f26si1110460lfp.5.2019.07.08.22.19.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 22:19:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x695JtL6017372
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 9 Jul 2019 07:19:55 +0200
Received: from [167.87.6.78] ([167.87.6.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x695JstS010652;
	Tue, 9 Jul 2019 07:19:54 +0200
Subject: Re: Several virtual consoles ?
To: jeanne.romefort@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <36184716-8614-4a7c-ac17-ca9da5b92bb2@googlegroups.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f5d0c8d1-9bf7-986d-f12e-ac73b5a9e263@siemens.com>
Date: Tue, 9 Jul 2019 07:19:54 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <36184716-8614-4a7c-ac17-ca9da5b92bb2@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 08.07.19 13:39, jeanne.romefort@gmail.com wrote:
> Hi everyone,=20
>=20
> I'm using Jailhouse to put several linux in parallel. One problem I have =
is that I only have one serial port and I don't want to use ssh. I don't kn=
ow if there is a technology compatible with Jailhouse to create virtual ser=
ial console to have the consoles of my linux inmates. Can you guide me plea=
se?=20

There is currently no ready-to-use solution for a console via something lik=
e a
virtual serial link. IIRC, someone once reported here to work on an equival=
ent
of ivshmem-net for serial, but I haven't heard any news nor seen any code.

The midterm perspective is that we would like to map virtio on ivshmem (jus=
t
pushed the foundation of that, reworked ivshmem, to wip/ivshmem2). That wil=
l
allow to reuse existing guest drivers on one side, but we will still need t=
o
look for a virtio backend stack on the other, and how to map that on ivshme=
m.

For now, the best answer is ivshmem-net and ssh and possibly also netconsol=
e via
that.

HTH,
Jan

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/f5d0c8d1-9bf7-986d-f12e-ac73b5a9e263%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
