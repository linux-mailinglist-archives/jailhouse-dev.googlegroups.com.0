Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBU4D77TQKGQEK4OHKXQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x240.google.com (mail-lj1-x240.google.com [IPv6:2a00:1450:4864:20::240])
	by mail.lfdr.de (Postfix) with ESMTPS id AF32C3D00A
	for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 16:59:32 +0200 (CEST)
Received: by mail-lj1-x240.google.com with SMTP id x19sf1099320ljh.21
        for <lists+jailhouse-dev@lfdr.de>; Tue, 11 Jun 2019 07:59:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1560265172; cv=pass;
        d=google.com; s=arc-20160816;
        b=g8DspHbpmmhmCZYuKRPwaJ6yrjb8AnrGa5Meu/fLW37GreIZRQkUcjy2GdrqCRkZ7y
         Hel72DW1/gkGqvlZeC/9ryqKxbenmDJ/QMzYnkyoP9440oqbDGoGSc9D0+2KenKpN2jG
         Wp00BolDXYI5eJmD9uj9ihblyPjDlg6DDYKOkXvX0QBsYqTx6bwUvdgO+7xo+mGpAYtd
         P/UKIQenM4HvMREMDNPyF039+a5T41b0LWyrGjCaGPHx5BKJOBTl9VN3nWgRWwVQyBhK
         BGFgSU+sYIF+OCJBoKER4jY/wxTRqwLRox+iap/HdBbHVsHGvb6m9Y2ZYMrRWP/Q9YEl
         s77w==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=tri2FHxzhSt+WlMBr1+J5c8JJSpKbRkFVAhJUuFPtDI=;
        b=QrzvelkpRvY61XqJCOw53AUpwmKFNemFs6NjSlVDTHgyqtF0UsTrwtIrrQ45WYs8Lg
         m0C9jK5nlYeJm/YcnspYya1AIt3fh9RGAVaxd6dM8e5RRlE03AgSf4LyzDrn8IwCsrEv
         n21eJe0iav+YBnTYAXD4vKBvkvFulajBCgOzH8iw1syco6LkM2SdbQwv7mIzFqoXJwyv
         o7eCho895fA2nmpcUsMKJCKhu4zY8bAXlInx5NBZJEUFgvM+Yc0bU44gd7H0KqVlXzFh
         2pXb8MbOW0/W5X2sO4067t5nvvHty3lHfulEj0qQ6Rto6kAI6Q61f/VAvv9Jibk1q8g1
         KZFA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=UyjMvoZf;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tri2FHxzhSt+WlMBr1+J5c8JJSpKbRkFVAhJUuFPtDI=;
        b=svG3bDIuK3k7pdye/Fd5rY+v80BMcDfSrSIcMAhnE+MFbPqe329sLuCZURRgsN1AmM
         ZEA/So71eS5FNXW3TP0ngY/2NkEfRIGsePJTWGZ7JF2Nfsv+ulHyMHFjzBopnG3T3oW8
         gOoDvDYmex9tGMrwj0++Go/eC4EBis0N7AhlyzJEz7Ev38B+elVQEgosAPjM78xz5lHw
         Qcd/IMqsfPenAunDGOHA9iVhxjgfv9e6L16mustDjlIxq8k+UkH+j11p5CVLyq75FLSf
         /xPVpm70MZIKUZc5PtZOYIIyiB0qE0+EzLBgOegTmqd7Q3PDUcOC69B/324Y+Lpp86Nk
         WprQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=tri2FHxzhSt+WlMBr1+J5c8JJSpKbRkFVAhJUuFPtDI=;
        b=ji5XFQioXWIkcLEPy/1n5zfE1fSLUzQvtHfTJvPlnm4nM7xhOYCs9ZBmez9AvtDa1H
         pLw2b+R0lnkMbNK5WkzfrFRpBy/JL1JrzDgMP9mijAZIXwMIbHXS72M7453+KUFaMahi
         Xe4eUEFWGTiVRgJA9MfJYJUjOjNKDCLow7qoP6yLfSMtwENYNFBLfMpy9v58Sexk8nj5
         jzFtB7eGeEeKgZ9tWHdLeh59OhkjWYtbFc0Vi2ljUqf3Abg0zQVMtwTJV3pjR3un0Zwg
         vqFdAYK89DvHVO6ViHgH+/fSwy3LieygelI9/ontr7jg/MVa7VkWy/6SOVg2ARdQsyMF
         Raaw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAU7dA7h94LC7R5wTN42gSG/cXmznhz1acq6m26RpLR3LbExA2Pw
	7YQSWqFaAAoDMTlFjNyoxes=
X-Google-Smtp-Source: APXvYqzZBU88CMSK9P5fv/PDVu49m6vygaF16rQSgzeCeNJilYYVxr0FsUVYDcvX8ePi3ERzfoTi6w==
X-Received: by 2002:a19:e308:: with SMTP id a8mr36825597lfh.69.1560265172269;
        Tue, 11 Jun 2019 07:59:32 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:417:: with SMTP id 23ls2221007lje.10.gmail; Tue, 11 Jun
 2019 07:59:31 -0700 (PDT)
X-Received: by 2002:a2e:9685:: with SMTP id q5mr40710239lji.105.1560265171304;
        Tue, 11 Jun 2019 07:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560265171; cv=none;
        d=google.com; s=arc-20160816;
        b=vxuzVWMqhhzU5hI6IjzrmU049Xubh8pN720U0td7lAruIU5i+1AaTwuBTfua9Ds/SK
         r5JjE6KNohju33H6fQpv0ba/5/s051ePGhvmM9bf0r4V+XiYnoxRn1x5WoQHKraHGpUk
         3bkyKv0rpq/ZG9w/XJvZVL+F+hS/PmD3Knpdvc/oFweNFFOCZSW778CDbwyBJLYT0P7c
         DVggVQZZf7TIkeYiDyl4EpjbBLa1/FXJl5oZR8nwE9f85rO7IWOxY3syBWMMHS0jmamr
         +puLwS+pmzQN4KiU73LMlrezlEeIFF0CnWHBpAZ59MplvUanwbeSvXbkovYalHJ3mvo/
         eiqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=pNLds7kj+T7CV3jzif+adi5wtQOMDQ4GXZlTV8xOXWM=;
        b=G1n8/r53OmNE8Eyd+f040j8F5PwmBSTBdZ3mLCfKO7EqaVYnA1qTSPQ3OJleUf7dvE
         j+UPaZZ6yQOzGV3sNKV+JZuN1NL39v3PVS27JKLcncG38PvHZAkHOBsXEMKvDH4dMEUK
         TygF0aeMCYXEOcjxUHXucXaUrLfAgDp+zYKhsrkFVMXxXtnAm2jpxVfRyth3bvP7uWHF
         QKrg+ct3T3pm8yQ2lRNPlL4BSABUYOF7QoQGYs5S7yZi34P4Wt/Po2nYeuvAtYTACS1A
         R8dXvMhXb/l0KZYp3fLXcS/VrxTRvr7eSKIIAyx1P5iqCvZcCai0J7v1tDf++E2gaDYR
         taTA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=UyjMvoZf;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id e24si414759ljk.5.2019.06.11.07.59.31
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Jun 2019 07:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [172.18.208.3] ([46.183.103.8]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0MZUWH-1hFTw512Lt-00LAwW; Tue, 11
 Jun 2019 16:59:29 +0200
Subject: Re: Linux non-root node question
To: Wayne <racedrive1503@gmail.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: jailhouse-dev@googlegroups.com
References: <CA++Khc2iKk1J6+0huh5__dS4HyujXzV9r+LbKLzuVZ4K3Bt5eA@mail.gmail.com>
 <57edbc3b-cadc-c850-8310-4640fc623085@oth-regensburg.de>
 <CA++Khc3HLaSEo9z2jd6hVLuDK-zd4P6au0KP3+6db8KBR47izQ@mail.gmail.com>
 <166c6ad9-379c-bad6-f30f-8af4f97b8bb1@oth-regensburg.de>
 <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <8e95891a-3453-02c8-8de9-0abb08a7e570@web.de>
Date: Tue, 11 Jun 2019 16:59:13 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <CA++Khc0yQbb3BjzCuR+6JLVqvx7EA3F5JHCFtf5FpN41CiGGVA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:f7geQ4SvLxKfHSoqFBTTttMJ4t1SZyh0Z254qNikEVYhstnQlae
 Q0YN084Uo5LE2c5R71AQEWSAq5dwx/oLwvNk2PXTtp+COMrOyYSeEG80aS8z2+2H0r7NDZX
 semwjY/e+fptezNNNIR4x3ROj+2S1g5XyJ2moJmiXvXH134cJfIMFgAuJJD2J/24DDGwgV+
 ns0HlcwDHd/eHE26Lv1+g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sAWe4mKpGBQ=:gN+lCtLFC8qif3v0iW6ZUs
 xj+dFsp4dF/8wyLO32hrN1fKu16mZ95UlME6YX8YtatkICbIS41YPCzO34X1glyOReVWUzX1w
 J+njQiZM1yKkDBUY1DKVM+md6NLsGMr+0YWqNkiWUOjAggYN66eihSnEoZmLw+oY7pywHK91O
 UyxmqyjUhD5IP9eda0ZApJqixRMidqdnRaiRFjPUm8K2wLHsUNiNcSUso2e4dSFViO4theits
 B4FD3E5TqWFZ5/q1PQryOPs+a442CTqg+lTnuhS+ccVXGdHZP2DgHPUEMk+JTI/tUBE4xFc8c
 kf5uRW3A+Zm278+ji79ymFdeSFaxm7meHrNGpJwpYgemGTNDECcuuHn/BQn69cmn56JlCYWyR
 YN+y/804lAdAnSda12veXdAV6Zbr2DD82hIo635Yn2cRN+gljNjgzACfKsVkwtKLwFG7OIjBP
 LjM2q1DjgE0SvspIaMVx/A2+z7xjB5ns+4N9ou8+egYfqarF5gI2Rzhhc9z6MEirrUbGzsGLH
 ynZZrUBeySKFUPw16k/Hjg0cruop8d01XU5BxqRSnDPMM2u0DrO7dHYAlxevQl3Iflw0yhFhO
 oOHMiLz9YCjAS6PtFrE9qZ/eJdmtABZ9JtBRtn56++Jz95n77GkMo4R9BsUR3tpgDzjQGtIMU
 Bf63soQHBdweqWEMg9iJqt/x8tnvJw4yU6XkozYnC/MF7OkPuOT6lQaOB0dOXcgMlAbelA8kW
 g9SlmMw6BAvkf/AFeH8leQ8d8dj9jl28iBz3qMvZz1x89QOqvCuBy1ujKz46uUHPPeKae1u9x
 uXfbipqK90FzoXmjsRFM+08aWLxQeuufR+nTiahRXE6NXiXqY3zbszHCTcCHjvx7latW58W11
 UT+Lq3JeHKOevWQg8xugx5HtXsQa+Lev0CUET0BtPAROdDt/AYLhquUcl2ZtcbBsNW79XI/M6
 lgSW+HPUb7Pfi7UNpidBoUtDJeZFPWY/Q9gKm+JL8hfFH56zchOoVq/Q8nmdHWIcN1Jdm1YNb
 GkdakSNlFxM8eOG/QjFhUrk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=UyjMvoZf;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de
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

On 10.06.19 19:45, Wayne wrote:
> Thank you for your responses Ralf and Jan.
>
> Yes, I have successfully gotten both the apic-demo and tiny-demo cells to=
 work
> on my system before attempting to load the non-root linux.=C2=A0 I can se=
e serial
> output from them.
>
> However, if I try to share the UART between root and inmate for them I ru=
n into
> a crash on the hypervisor if the root linux attempts to write to the UART=
 (after
> creating/starting a demo).=C2=A0 Does the root linux lose access once an =
inmate is
> created/started?=C2=A0 Or am I missing something from my System config or=
 tiny-demo
> config that allows them to share?=C2=A0 I attached the crash in hyperviso=
r_output.txt.

Yes, the root cell loses access to I/O ports when a non-root cell gains the=
m. So
you need to stop using that UART from the root cell (and may use a differen=
t
one) or only use a virtual console in the non-root cell. In addition, guest=
 like
Linux may use the IRQ associated with a UART, and that also requires exclus=
ive
access.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/8e95891a-3453-02c8-8de9-0abb08a7e570%40web.de.
For more options, visit https://groups.google.com/d/optout.
