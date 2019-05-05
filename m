Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB3V6XLTAKGQEIJYJCKQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 4327713E6F
	for <lists+jailhouse-dev@lfdr.de>; Sun,  5 May 2019 10:31:43 +0200 (CEST)
Received: by mail-wm1-x339.google.com with SMTP id 14sf2605819wmu.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 05 May 2019 01:31:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1557045102; cv=pass;
        d=google.com; s=arc-20160816;
        b=X3qqght/bZpre/vm5HnjcNdoF7STv44WedrorZSM5gCPoyejJTjf8F8X8urea3Njbs
         j38Dq+WET3crIK2AztOQcxjwYxzmT6K2jlR+pggmihVysCT6DC83E70DVwouIKYyhXwE
         8AnQOATK0kv0Jtc9QO7sZhpJ1l8d9VQ916WuprkgrRIE6/yQ0sdjzGstuF/1svzPbDOx
         rC6lOBrLYvGozpv+FJdSLVxX1MIXegvqaBahgyPjf8+g8DEaSwGraKibWd9WtzbofbKZ
         N9tZu6eDy6JqnQqjeb8Kv80DmY6n8zVaTjXcFEjEy5o3UhBWupNDZqJP7JF9AfY+vr9J
         mzKw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=U6yBzlegc+UV30I686wOVRZoiQQDFIL+TZIax0cE5qM=;
        b=jgQhEgXtioB/eCHeerS/QDlNUGumGloledbF2GzVywCCSGe92ngLm/Kcn40WiDUECi
         D0rTySCW9hHR2Bscu/QYbM/BDXqfFnUa5EUDMg+mGwUSY1aK3kZseVgBdk0POSFeEVvf
         6nEa0HUoC0bJAeKekUNRBokiP7gGUW6L6bymQSAQxV/NwqxRW6EugHb1nSUYtg79zKtJ
         5yxcpLTSmWVEm+ibbWRREeFzDvI+RmEj3f//4ewzKHqjpF/OTnewI2+MLJTDF+owq+lQ
         mei2n5cwMZkGCXqb0/vkC8iKxwasjydCZcLZ+AtDecMap1bjXsUUCmpMGdBU9N40N6jX
         2y2A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PXyOJ9Zh;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U6yBzlegc+UV30I686wOVRZoiQQDFIL+TZIax0cE5qM=;
        b=qaV/OtQ5qBeUxLLhYFsyjkgnm9fSl9gkApEBVTNpPXbBysZ8Vv9NV1/B65LgbOLSGV
         5oLG1Dg09m5JW9PlPBAhIIAB8MG2KWMvUNSgXVWNw1/ECO86v7an1vqoK1jUSZ4/UkMz
         Rq1F5TdasvnbVO3s9Caz3laRPd638gQ1CuT8R4PwGobs6YSiIZ4Pca2asD4JOuP4oul3
         WbKT6ztlDN6uj+si0M8PYKFmTJobvUn/o67B4qDrwCymEJ4/o+htw4LKUZjP4iP/gdbQ
         Twct/O/Bgrq/f1dHlmE5ZkqwURFCE+FXyOwrjErNYDPUHtSJotRhGl0ZEzD4sx7UxN53
         oezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=U6yBzlegc+UV30I686wOVRZoiQQDFIL+TZIax0cE5qM=;
        b=NfBlin4RMZ1Lf66BsN8l4vCHVU9e1iLHpTrimCCFoZW8UixrpiN4YPpZyjbWi8qd4h
         6peYiYXidiQIDOJDTKAPmFSdSU/ZdSc4Extf7pEESGrKLZsCHYsXDGdxWLaeNZNNvHXa
         8AgbpeZDymtiycjjIGeNu7irTg8W3MobXbVf6zLqV/0gXS50mFt+PJycTYmwMu1N0IZU
         AMQ4iXvUfuDICLXN9zhGW+HaWnobP2uoaZosUFqipRbcX5ty/A6So9r7RjPY6Ro0KWuG
         sNxIcdHToR4cfRDQgdMskok4+sWL6KYbYGmXh/2cbkIuNM+wndRgoS5gnYMAqH/ZWQc5
         k7TQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXkwrSeq/1z+LZflOujuJeIJy+7qwNB2nPsWsYhHAJBnRgh0ig7
	O4DyHCyv2Hj756gcrDLa9Mw=
X-Google-Smtp-Source: APXvYqx7ZSE65z9WOYEVgoYzNRwQPHnwVChT5E/tf6yQtAy/HauTJadwvUNrYel+I6phiBK3TcWhyQ==
X-Received: by 2002:a05:600c:48a:: with SMTP id d10mr12808890wme.141.1557045102881;
        Sun, 05 May 2019 01:31:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:9f09:: with SMTP id l9ls233393wrf.15.gmail; Sun, 05 May
 2019 01:31:42 -0700 (PDT)
X-Received: by 2002:adf:f70d:: with SMTP id r13mr3873396wrp.276.1557045102358;
        Sun, 05 May 2019 01:31:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557045102; cv=none;
        d=google.com; s=arc-20160816;
        b=tMl7kek7cTDVYbhlWc68kIwrnCH9gAoqCqLe6jnN4P8ZV/2je0CCbNao3tib2Y1n1d
         2kbUwL9WIEqs34MkTKfm7sl1+pj1KY2JjI6ZqikwqEPjUTfJEhz4acpLylH1Yk7118BM
         DQCxVdRxPohRzuMbNlidwHZt8YMzNeTfyLSgDIkkR0hAeUeeqGTkPYzpYZMguK8C4GBD
         yr2IBPoAF+so2BF9L069Ngv5rUhHSQIb5UJeuByuGyXWvZxVdoBaMwpMdCuPiWVpsWyh
         5sbSxnk+rg8olEfQuAPnqvYoKdlP+QrkYP/G/W/jX0us+2hANsqvDKQy8GwZRTXKMRW2
         fa0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=UaLuMk+3ie4sK3+RnyXMqI2hRL87vMTaJskGDVFnXiQ=;
        b=nSNWJqkMS5qQ9lfPSqLmX6oVzkDGVZRWrmiZKoWXCe2OjmnZ+BvFoR111itQhRbIft
         Su/9Ds+l0Me1IvPc6gR4EUVoclnn8Z5zXFGJj7iUt5YeK93F+OQ8/cr+QvG7FB01S7To
         LFTd9optwlcfz6db2sXL4INRLnHoTfkwDgHHVk8rFbwHdu5E/c3YvEz1wO0JuOyWSPO5
         ycj/DsqDthxVWqyHNi48N4VgJsPSBDMLFn2r16JbTrIlYyG4KDPln9A7ob/dXCvqHq7i
         YkJNe4pA+IZ5BheGhndtqu3UHGQaLISqc2JevrdMr1XbrPcNcLSv7Up3fL5zUjHWqUsU
         dWqw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=PXyOJ9Zh;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id h5si19934wrc.1.2019.05.05.01.31.42
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 05 May 2019 01:31:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.54.22]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M1noI-1gTZlX2sSw-00tno6; Sun, 05
 May 2019 10:31:41 +0200
Subject: Re: Uncacheable synchronization between inmates
To: =?UTF-8?Q?Jo=c3=a3o_Reis?= <jpagsreis@gmail.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>
References: <81dd76a5-12a2-442a-9b2e-2f88ccd807f2@googlegroups.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <41a57610-3a10-8e60-85cc-f25cc6df29a8@web.de>
Date: Sun, 5 May 2019 10:31:41 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <81dd76a5-12a2-442a-9b2e-2f88ccd807f2@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ojYo3jXxeA4/BqHIhNLthW6v2Co8vPinsCx8i7TLr3fQBBq9seE
 6t8vD9Y2AN7wTZ9e9RpH2CTqJhYjnhhI053q01Xk1rzxujcefvPvKcMibT0vStRnUHakwqF
 nrjwuO1i/lmlw4fGz7F0c++1Kc2rhZJLT8LpVnEZxoR/Sni6DXKQlqcdZcxjv9LSk80H9A7
 p0v2jIlDau45FDT+Zw77Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:gCMK+NPDJ7k=:CbwrhizheGD+BCH01S0jeI
 CKqCMSE52vBTQXHvkVI/cpDjq2IuvnBc9pjtGNkB1GMThy3dhWNTzXrfVQ6weKRYGR1zJS7a5
 qTE/0wMc/rbukXSuayXHjR7xR0oTkJwQNPJTbRjTzaWRE4ci0r8iVV+e+ICl3jf61vutd1Faj
 MfZBRp3pbgWu7GOvGgMCLJ8/UOJ7fd8TyGN+7InI9DWBU7RvWSTnSNPD997JrTewhGKR59A4d
 R6cx6lFa5N8BbM4BeYZGSxLP1i4hKYkzvlQc2uDMblDDJ/ejFpfSBmzmE1dxJY6xZMANxpmOE
 lSvK7zYPUBZcvZ6g2AeZ/gTGDKI7qj3pSAF+F6pblyLC+dVD9OjFmUnVWEUPoI0ptxPSG819N
 qWxzDBdVDGwKoIDMD2SIYDmTnUNftMgLskJaf2ugLfT8hl+2IGDg6obAM2IFZ4bu7So3KppzY
 8/8OR7ARfhMfjgDOlK14BI2dGq2A7sfQNBdgxqHxok+p351JJ312fde7c5k4E5hKFuQmKkx5y
 Ycp16Gl7CYtNjqLR9IGt9Ltta/1tY7cBErYRBmyUcsOLBlbf+EdvKocbtOju7Zn5mkIkTIQdc
 GbnQCm5ayrErhn073X/cnpb51B+IeSLQATMLPc3rFNzALMKIvACcHYnPvwyelYGfw8mU6JkMR
 nUf1xD8xd0mvyKSgI/SgI81ceQBGt0SR16VRfujwwxDAAUdlRD8GKKnASoJ7+X8Rr9B9Jg6Tb
 zDHNN7io2XGDEHvzpFRAEb5oF6DmUPcqgyyHs5XLWwDkAan385mUELdCmKP/4JhVktlSwHIl1
 O7PY7KIkZWerK2dBmxOKlE1O63GxZyeSn5ntEynawgQM2+P76E9QAojhnxhRP0b9npEG6iVL/
 X+lEp94kKCYQbzttAmY5MaBQfosh8UmyPAPg0kI1I0vqIx34VlfcX43DziWfPdiuBU3JZBpta
 2y0Xxrn79OA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=PXyOJ9Zh;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted
 sender) smtp.mailfrom=jan.kiszka@web.de
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

On 03.05.19 18:30, Jo=C3=A3o Reis wrote:
> Hello everyone,
>
> I am trying to synchronize inmates using uio_ivshmem driver, but the sync=
hronization requires calling functions such as blocking read (to receive in=
terrupt) or writing to mapped memory registers such as Doorbell (to send in=
terrupt) on linux side. This synchronization code will likely "pollute" the=
 cache. I want to know if there is a way, or if jailhouse provides a way, t=
o execute these few lines of code (calling blocking read and writing to doo=
rbell) without using the cache.
>
> I've noticed that in the non-root cell side, we can use uncacheable memor=
y by passing MAP_UNCACHED as argument to map_range(), but in the root cell =
side i didn't find a way to do this.
>

If you are behind cache isolation, you likely also want to take a look at t=
he
recently posted cache coloring patches. However, they also have no answer y=
et
regarding the cache impact of operations that trigger guest exits into the
hypervisor, like that doorbell write or the interrupt reception on the targ=
et side.

If you want to avoid such disturbances, communicate by polling: Check the s=
hared
memory content periodically, e.g. as part of your main loop, and maybe do
timer-driven polling on the Linux side. However, you do not want to access =
the
shared memory uncached as that will only slow-down your work.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
For more options, visit https://groups.google.com/d/optout.
