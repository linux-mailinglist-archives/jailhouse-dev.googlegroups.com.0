Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB7W7QD4QKGQESZJCMLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x438.google.com (mail-wr1-x438.google.com [IPv6:2a00:1450:4864:20::438])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B9CA230BF9
	for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 16:02:39 +0200 (CEST)
Received: by mail-wr1-x438.google.com with SMTP id d6sf3807729wrv.23
        for <lists+jailhouse-dev@lfdr.de>; Tue, 28 Jul 2020 07:02:39 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1595944959; cv=pass;
        d=google.com; s=arc-20160816;
        b=d9AtUlCTZOoZ8mIQLxqC24aPq/e3A9+X3sDW1I5RMUVnrl5RyBpNceeWsUooQosWGO
         gBuWoOl0mRLvoYNO2N08sHnFv6tq95SYHPEyG9d+V8ntfKKHp0N650bme44pLGbUotNg
         66QE2rkxSHy1gVn5QXKtsHGLthlwlMavoIXHpsQ7EMW1wa4UqYLYFbPYvETA9SWSfR4t
         UFheft+arRCBNgGpNVcqFxnTqAEhAz/sGDt9oIbp8JDFZDPO7O/LeEZ79Vo6jcDEY2uI
         g/BPb12D+VOoC1Rs2R3MRi7dqREkI8lb90ivm1p3J9wTNrFOBGjyEvXl2cNVi+K4bj86
         cr/g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=9KH2v6jXzztSj8WhO6uhp/tC5UvXNpC8uSK3teCgHoY=;
        b=rj45cKpSoOkwpp0s520YVSHBaNqMQJ5xeFuAQ3TGVz2TNn+ap1FuMectMoBeEfnqWj
         2GWAJw4MN/Ynqxb2t54XdPuYRYrz1pdoGwVYx/0zO5CSJOM73RlvE1GPfzdJCQ+GygSR
         sNfN1Gbwi/FrfeHTcDyzWY30JNhD3c3DIaYMOmCzNqByvIFLzEd2gXNV8HwJRiJ+82Qs
         b1OKgbn5zlItYAnq7GdJeCUykduB4mPyCWOuJJD4Y4kTJzo6Isbs05ycpAp+0PGWup53
         RknrrLjWaxkx2Rq2Oakdmq9T+8VyKiT2KICWKnwmXWklQkbqjZMh8qqw4ygP9sWg7oBb
         za2w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9KH2v6jXzztSj8WhO6uhp/tC5UvXNpC8uSK3teCgHoY=;
        b=jwTMbIOiBauo1+t8RnawXtoBzF4H3OE42egT3ndW4+DYiXagO94qpQ+dLFhQ6XgfXs
         bJim94R9XwRr0oj0nwoS8/CQtnYuiBvPfGvoDhdP7utBLlqnqa8u14TMeFXjfGSJBlTY
         cmTEctdrLl+8xMPYTDdaHAJlJwhsXZq9kVpMqmAWAhKIFOgWuDPuLyO/PkPPeyfpmYWd
         iEzN7dcKW+zIgQ72DqkB6JToXZDTLqLRGzON+YeQgcEe2xzYKW8cjh2h5o73Ytgi/t5W
         vBFZGahxteBwgkUfkN3qg8mvfYm6cAf7zXeIxGln3FnlCUqsdHSQxMP9JepHS3qfB4XU
         0FqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=9KH2v6jXzztSj8WhO6uhp/tC5UvXNpC8uSK3teCgHoY=;
        b=ke/jAUYOwjsNsLSdIUAnqDh2mitowntpcSKXXJf4J6dXtG3kxEzTnJUyFN18Zzqqpj
         btHHyJI3r7KvBSah0RVyKVtJDw+eQSc6Ab0xL3s62heL0xc1M9GcX5VevgRpJEvlXbfI
         LOyOx/UyGEzuoFWW+acrvL+4MxuaW+jSqibPvMUmS86PpK1j4CLf+Yln4iTWy7tq+bQG
         LdTQjkLEiaXZpl+gZBjmD15UDDctk//WmRkLbes4SwsCx/H0TYGD0aFH/sYfUdzFt2tP
         ZzaV5Z1KEeZ2H786jGxqOGtD9waXJYBEoFppUxiEmcpBoP7q4v8CjiLxpz1MkRSfSPWr
         1u1w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530SAsBDx4hBjz7cM6Th2p+me41Kz3qUfXwzYmcLNRX5oniLPyd4
	VwA+agy9KF/nyEiZOAoFxm8=
X-Google-Smtp-Source: ABdhPJwkxDRI+0aeYt2uxd5kp+2VtJZDBIUvCRy3d119OsdjBEaFJmLtBkruYTEerBCsay4zTnOcdw==
X-Received: by 2002:a05:600c:2246:: with SMTP id a6mr4268937wmm.71.1595944958821;
        Tue, 28 Jul 2020 07:02:38 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:9c95:: with SMTP id f143ls1602869wme.3.gmail; Tue, 28
 Jul 2020 07:02:38 -0700 (PDT)
X-Received: by 2002:a1c:c90d:: with SMTP id f13mr4460295wmb.185.1595944957852;
        Tue, 28 Jul 2020 07:02:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595944957; cv=none;
        d=google.com; s=arc-20160816;
        b=nXXhvDh/U3CbstKq7ecp2Gic2xgiRhQILx4Teul3A+vK3ROERbU+n5bcqZSBJ0duav
         R2V+/iizgV4wU72gww3uabGUBrhgt/euLvtmmbri6lT26h3sHEyDr/Ar9QAL1BkFnfS6
         RLpX4gF5thnKrVM6aNJE1O0wUA9lBAI7QFmW/hrARVea0ULSBWp8KBCUiYGxiFblr4xP
         1tUROSxzGoFygrYtT0ImpnfKr2tu78F/OUtL7KyZmRyySKITI6FK8FiFW83JPyYM0Pm0
         KsUCZmOjsqZzmjVtf9ZUO9MhN5IUVwEWjNALjlotNMYK+DdQPlxVihY5qm7ga87UhRsm
         EaJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=OPMTSzW5/pUZp7PcYa7xBRmhqtX1qT0FnbZnWg6iFX0=;
        b=PCeWarkN9rdoPaxBzwk3bWpGu4OU2ISOe2Pre4tiqsbDyWHjRYeiwe9cP20EjZrWq0
         jZwqD1UrWQS8CmHUVvgytMVYldd24kKhArubzpwgDlmMnzCgZS2uGMv6h8qnqYZs+VdG
         QjxwDIvhV5XnM9jLOBCcLgTy3U9rrUW/omuBulKj8v/LUICAo/xtZ3zFJAFUvVDBST5x
         9IE115lXPNH4aZ21fu26Z1FkzaNeyJbNwGg2wNt7a6plTmo6gsKn/rrn9lrms7A6msJk
         LogjkN4LEU55/8DV96yQXXPFG9WN+745FM5zR8jmrpf34DATMCYqRvCZyrWYfLeiElcL
         kUUw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id y12si661019wrt.1.2020.07.28.07.02.37
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Jul 2020 07:02:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 06SE2bTB022514
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jul 2020 16:02:37 +0200
Received: from [167.87.93.82] ([167.87.93.82])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 06SE2a0I010570;
	Tue, 28 Jul 2020 16:02:37 +0200
Subject: Re: GSoC Report: Week 8
To: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>,
        jailhouse-dev@googlegroups.com
References: <CAGdCPwuLnZQSPxaj7j_iZwY16d+dN+FTo8H50Jjog6T_-Yz0Gg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <f9395dda-b39c-0826-ff6a-8c60f4efac1b@siemens.com>
Date: Tue, 28 Jul 2020 16:02:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAGdCPwuLnZQSPxaj7j_iZwY16d+dN+FTo8H50Jjog6T_-Yz0Gg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
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

On 28.07.20 11:31, Jakub Lu=C5=BEn=C3=BD wrote:
> In the default configuration=20
> <https://github.com/siemens/jailhouse/blob/master/configs/arm64/rpi4.c>,=
=20
> Jailhouse allocates the memory range 0x0 - 0x3fa10000 (~1018M) for the=20
> cells. The rest of the first 0x40000000 (1024M) long memory space is=20
> used for the hypervisor itself and various shared memory regions. To=20
> avoid the Linux kernel using all of the memory, |mem=3D768M|=C2=A0kernel=
=20
> parameter is used=20
> <https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-=
firmware/files/cmdline.txt>.=20
> That makes the memory above 768M available for the non-root cells.=20
> Regarding the GPU memory, the |gpu_mem|=C2=A0parameter in Raspberry=E2=80=
=99s=20
> config.txt is not set=20
> <https://github.com/siemens/jailhouse-images/blob/master/recipes-bsp/rpi-=
firmware/files/config.txt>,=20
> so it defaults to 64M. Then, the area of 0x3b400000 (948M) - 0x40000000=
=20
> (1024M) is reserved by the Raspberry firmware. I don=E2=80=99t know how t=
hey=20
> make sure that Jailhouse=E2=80=99s shared memory regions don=E2=80=99t in=
terfere with=20
> the GPU, but it seems that they know what they=E2=80=99re doing.

That is actually a valid finding. The demo image is not using the GPU=20
but this means that we are using GPU RAM for sharing?! Fix for that welcome=
.

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
jailhouse-dev/f9395dda-b39c-0826-ff6a-8c60f4efac1b%40siemens.com.
