Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBDMOQXYAKGQEF2W24GA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x440.google.com (mail-wr1-x440.google.com [IPv6:2a00:1450:4864:20::440])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0C7129BAE
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Dec 2019 00:00:29 +0100 (CET)
Received: by mail-wr1-x440.google.com with SMTP id u12sf8646575wrt.15
        for <lists+jailhouse-dev@lfdr.de>; Mon, 23 Dec 2019 15:00:29 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1577142029; cv=pass;
        d=google.com; s=arc-20160816;
        b=EdvUJ5vKgXTGT31Z+HXgV2uBbcAN9mA0MXg8wkv9xlRXYJ8NnQVplfnhvUCnVXYbp7
         dLSy73TYep5elH5qfJ41ZjGT6bXcH0D7GNlq8wcRrOpoi2AZDlA2ir6gfz8awu2WXwOO
         AcPizAh+fxb+AERhisTdZl0zCblu515QB7LeJf5IuRBl3yc9ngvSGWvpqY8/pDz9lTuB
         2HAN9En4wbF/iyPMH6RkC+QTiqQBadjODrK5YCXVpSfxbze/UgwG28Ztd5zvPwsDy7Ii
         KJIkB4LcAtIh4OaZ7Ngf8vm97VIyWT9pevGZO3pw8pPU8CE0ksv3nH1G6b8Lu6PQgCiV
         e6EA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:from:references:cc:to
         :subject:sender:dkim-signature;
        bh=Xv5FbcOrW0UqzSmeUCU/9JDe5RrDjbU/K3CCZtvFdo4=;
        b=gcRVkx49gzSygnAgj9p7GF7Z2a19M9tNz091WyZCS0JbWLXPq0NBP8Cmj3NBHlIRFG
         iSIjxeHr5oHlvSra3pjY1kG6F8pPQUJ06BNyAlIfMJ0D9sOBCe8VLPhu91NOIYcSajzZ
         7B3/ED1yGPBPTWnWfa0TlO5V3Mav/qWeWfn1xIbaXFRQaYeqtjFxQ/B6jHpudA8F0QfT
         0TxBFeh10OhQfrxgS/7Gs4PxZPlucWIJ4Bj6Pet6UVHcaonepWDVAlILg/dKptXudiF3
         z9XLQwjfWFBDiGq95xB63QezgGorxrHVYdxzh6rfEI4AtftzaLuj/7eAQcv3Plm2wdJi
         K1ig==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="bro/+PL6";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Xv5FbcOrW0UqzSmeUCU/9JDe5RrDjbU/K3CCZtvFdo4=;
        b=Jx4jcn7ZXRVbo8j1tqG7Gvu4fWDrHVm9HGdQ41dM5f0xa4Qn0jp7wOvKhWS8Lmbtxn
         Lgx9VWsfcHm/rU3Qy5BGhSm/25DD7QeXyeD4CAnlGh/+A1xeAMgIBXWQCehPNoaMnKL7
         22Znv6VlfkXKaftlAz4nmisa3784TC/bi6+NMxovb8/2vNlbU09MI1VllGAiKZkRLSNY
         GiPDY9p/7pYzAQjq/LJyK6d6Pu+WmaiiiJicluQNnPWodi64bLWAY1qN/hP9qp7YOqa3
         2I9gxYps4WnWlBCOBKmDFvQyCQTmbnCieVP6QAJeDiXwHWzWE0F1Znrn8uvKpKCqX6sp
         4F3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=Xv5FbcOrW0UqzSmeUCU/9JDe5RrDjbU/K3CCZtvFdo4=;
        b=SEmctMLq8oBr7OO0oZDIppJJqFfpMo3fHpvJBcNj/HIICf5SvqkpayHUiLV8uxMX6X
         qTDjDZ5KixdPQkGk2aUkJDXXmr4MDv8NbrldSrF3COW8VRdkJkCIcSvZh4jK/1Nl8ASp
         4RIJuoxf8CQ1wv/INhvDlhGt3aDK5q9d7RYJ1dpQ1faCKJfo9eLKboSuBh6jXvooz7Ex
         8+72ReoQbJLezN9lk1pAUsuFRr+0nstOTqsVIlCoJN6LgModotyH4DAABLOWqpmxCppb
         jVrC7jix8v7bK5HAh11n1GgmIhHzBPJi/Wfe0hY6VtG+7cmIO1nV5JdK4jrQmR9oZS3s
         71MA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUXW5AZmpPsMqfkph2JHJUz7pEpqhVy3MHSgwNWA3ln7hE0xa5c
	1lbbcCrR9/rqiypJe6RbEqk=
X-Google-Smtp-Source: APXvYqxR3FMRH+Bik/OoTy8z+EKb2Zyyt1mL6dY2Wg3EqsENQ2SPhSUfEgRmteWhkLWtjVlobOIS3g==
X-Received: by 2002:a7b:c392:: with SMTP id s18mr919724wmj.169.1577142029454;
        Mon, 23 Dec 2019 15:00:29 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:6303:: with SMTP id i3ls4698774wru.13.gmail; Mon, 23 Dec
 2019 15:00:28 -0800 (PST)
X-Received: by 2002:adf:f88c:: with SMTP id u12mr33655215wrp.323.1577142028932;
        Mon, 23 Dec 2019 15:00:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577142028; cv=none;
        d=google.com; s=arc-20160816;
        b=LA8hB0SSh4R59SwIOfCxgd0gHbIg+oYb9oQZev7UR/NtScqB6/zBxZTNcNCTC2cb6f
         +e1a6aCH0Q1Uzl0kCbFuwIig3n3Kt8l2m16c9pTjuc+vFZhlLEWSn2gkb8bKSVcCjv2S
         EzXc4M/GX/MPFB91czKwY8tnToHhr/VIWCZffyEEddlRAyw/49cnO4l5olriXNcptixX
         vAathy4H48nSWfOr5I8LCmyTKulFrczJesk251uwvHuJZQUYsXB5JwuX1++/98K1qUKx
         5FwTH7egVZRoH13QoKvOZ1SousgShotoN1x8pxaQ9N2DgpDbvOeGs7AEGlYuawlmXHFR
         W/Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=MeksQ3x+oNTKptRYLX0/WHnawMnWBRFOuoMValHP1vw=;
        b=IEJ+iy1srFK6CudL/WiDg1pRwpAhYzQAyB/r3zy6DaFx+eFuAwslWiksxNTMDTW2uD
         sojOSdO3KKhDJB68UhZoqZJO3ISm4/tTDG2E04J8Tw9WUfqnz9cj350tpfLchTO62Ejh
         ZEJS4cxBsZd9TA8XR9nQ6S1RlCkwij8bpHP/EuTwxBtoeVEW/9Ha84WY2R2PJ0kEs5WH
         VFW18IjgODjf5g0ZN46XfHDNHpIfOuGTbVrESWQlrsSavhs8v2C/WKnARBxVJ3aC7Kj3
         99qKJ7jtMgzHSFgtrFhDsIkt2l1pYu/tgGZLvT1fFESdSdulLiR/xPqBVLs2SKyk6UVF
         j2DA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="bro/+PL6";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id x5si68551wmk.1.2019.12.23.15.00.28
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Dec 2019 15:00:28 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.2.196] ([84.61.93.39]) by smtp.web.de (mrweb102
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0M73WL-1jfd3R23K1-00wipk; Tue, 24
 Dec 2019 00:00:28 +0100
Subject: Re: [PATCH v4 0/4] Initial support for j721-evm board
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20191223151353.22495-1-nikhil.nd@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c89e1a49-facb-1c7e-0625-322fbb7a604f@web.de>
Date: Tue, 24 Dec 2019 00:00:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <20191223151353.22495-1-nikhil.nd@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
X-Provags-ID: V03:K1:mGrQ2R+2GMXZGjJLwonmffohsKmf928U6q0AG3bUKZwUtDbrTAz
 04gUQm7YmKbs/1xA943Sk/jfsWM8n41466V8pt+KPPkU2FI3R1mg1MVYZytUoqW+Kg93FdM
 8Cf8pjsbSRSx+jMd+PkdApCohNSrSBC1YMxGw6cWH9qduf6aXnbjZETpoXbkPMYWGbr6JzA
 9zqdj3pV2mrFNmME5Qogw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:0DIfK/2GX50=:3HoOK5GZ4NnL1JtsVjkcYw
 emufsTc0Z5KUnqXyTXxKaCBMux5smoJZg0w1S7vt5xjU5k/XtOYgl8117t+udnIKhVSD91n6G
 eR6CC6YQtCrQP6tJX3ES1RJdq6BjPZAIr8W2VNIAEpkWEierFVucJg9u1AJVKSzbmsjPyAffd
 Q+YqwSRKw03PEPZUet4jJWB2VB55FaU8SVvXPs3hrDDrgWeqO0AugJ99KrqfwSQKXhYCmXXP7
 5+YHpp0JRU6jm9eB4rCI2dZHSzr3bwUiOuNpWIUvxq4YRP5Ghx8/OiGpQvbXIwb41u8m2ZD07
 So20ItFg6in1mHC2tgglkFbfsuNUCLQfQx//dr+wCb9ITT8bEReJ7VpKZRaxhgWOZuWur0ll5
 Z3SkkVojBe0tST+fNr7qH3Jn/gUsJe1zD3bDdkDTf6ekK4/9rypfmDiyXrHTQu1JgZJwqpe/e
 QIwKkuOskFWzBHXp1aN8bCcQ9MqNqkOJ/RBjVkhatsV9UbdWcZM8Z1O/aF24NDf+tR6hju4p/
 zjVecttCDrKZc4NKSobxTkMpMg09trCl+krawTNpE2N1aOsu/MkCifStV48fL65Vbmkef6O6O
 8Tau01kIrlzUO6SO0u/sHdmDB9PRxrHnB7ykxibGLxX2UU4+iHmt1+IyRqtf+u53dBBCVgV/e
 IeWM8vSe6po4p7LrswzmC2pwjQfLcPeSltysqb71wUyD7HQa9oL19Pgazpz/Cw74AoQvx8r8T
 T66p9ikmaNgKAaUhiU73UFfCQ/x759ZYEhk+kOdCTE+oTnjhY2xxON2ASJgI2o7zzXIBOrhgb
 GOB+ZzpZvxkxy6xpqKiIepJK/jepY7Yi6m/u/pmuYAMuPqTD04J/lWurT2C5ivxXNezqPcSYL
 ejFeNuZ6fVTglqrglfgSTFksV0jg3Dvrs8al7YDwtrTMFSmJAAQ3hxKJzr+rcw6pXrQ+fCVsS
 wLdRsAi/QqvlvuJZQ3KXBZ19lIyiNdVQ0h1b4MQslZWgltsswsV+yH3ZwJuGsm5QH7ProUP2b
 TNjjPtm+c0Q0b7PvAcX5YRzxtAcdk7KyJylSDuZj/3nwW1VIGwxjAHgi1Z6VJyJhEk36ohzCk
 7PDyA6Qy9S6uFJQksFa308OtRuj2mUrDV75gORxnY+V8KuvbgnlEY+XGWuyEQYRXzzMYfm6pn
 TP6J5+a7sOwL9J3eiM3DAL+uVNzlgMSCyRF/M3R7VVxGtbL66QtoC6p9vkrtaVXsX28n1NUY9
 ofLEG2L98FQcz7hQt4s2cdQ45l4w/6YLe/uw8Z1L2+StpQ+zXs3K5idLpRXk=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="bro/+PL6";       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as
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

On 23.12.19 16:13, 'Nikhil Devshatwar' via Jailhouse wrote:
> This series adds support for the Texas Instrument's j721e-evm board.
> The J721E SoC belongs to the K3 Multicore SoC architecture platform
> for automotive applications such as infotainment, cluster, premium
> Audio, Gateway, industrial and a range of broad market applications.
>
> Verified with the 5.5 linux-stable kernel on J721E common processor board.
> All DT bindings are compliant with upstream kernel.
>
> Nikhil Devshatwar (4):
>    inmates: uart-8250: Add MDR quirk for enabling UART
>    configs: arm64: Add support for k3-j721-evm board
>    configs: arm64: Add gic and uart demos for j721-evm board
>    configs: arm64: Add Linux demo for j721-evm board
>
>   configs/arm64/dts/inmate-k3-j721e-evm.dts | 433 ++++++++++++++++++++++
>   configs/arm64/k3-j721e-evm-gic-demo.c     |  72 ++++
>   configs/arm64/k3-j721e-evm-linux-demo.c   | 262 +++++++++++++
>   configs/arm64/k3-j721e-evm-uart-demo.c    |  72 ++++
>   configs/arm64/k3-j721e-evm.c              | 363 ++++++++++++++++++
>   include/jailhouse/console.h               |   7 +-
>   inmates/lib/uart-8250.c                   |   3 +
>   7 files changed, 1211 insertions(+), 1 deletion(-)
>   create mode 100644 configs/arm64/dts/inmate-k3-j721e-evm.dts
>   create mode 100644 configs/arm64/k3-j721e-evm-gic-demo.c
>   create mode 100644 configs/arm64/k3-j721e-evm-linux-demo.c
>   create mode 100644 configs/arm64/k3-j721e-evm-uart-demo.c
>   create mode 100644 configs/arm64/k3-j721e-evm.c
>

Thanks, all applied to next.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/c89e1a49-facb-1c7e-0625-322fbb7a604f%40web.de.
