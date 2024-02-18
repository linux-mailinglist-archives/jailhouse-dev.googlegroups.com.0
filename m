Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBIGIY6XAMGQENTGXIYI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x239.google.com (mail-lj1-x239.google.com [IPv6:2a00:1450:4864:20::239])
	by mail.lfdr.de (Postfix) with ESMTPS id 08571859698
	for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Feb 2024 12:04:04 +0100 (CET)
Received: by mail-lj1-x239.google.com with SMTP id 38308e7fff4ca-2d22e2f9a0csf6393501fa.3
        for <lists+jailhouse-dev@lfdr.de>; Sun, 18 Feb 2024 03:04:03 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1708254243; cv=pass;
        d=google.com; s=arc-20160816;
        b=o2jAKGlSlVJHmmRThJKHREq39y+1MeJ9KIVlSntV7iTkxL8jyYvehDt1p9QQFgXE0J
         AXpujNZ4kWRY2AAp1HMGNA06rsZQw74bEmkYTeQU5V1WSIlDsKRYu+ApBDVVcwCQCX9o
         47tAby9aSq2PUbscute+dtBFKNEDWvjhabeYxDXsQeQI5aumb1Ag/wRESUZgsLiVi1EW
         A75QVwtvr6/GkXAYKsNlv9M6KHO5o4nPXiWbuQWHtHtJoVC3FfXZiC1wGp1EaQxJvEVw
         36iafbFVgxHxQ3THroleKixrXfG5a1BfnT2Z+V1aCW239X//JwYWJbjxIAu004gff4ua
         EaDQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:ui-outboundreport
         :in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ykdypB+6b13qBN1CNXzXpRMrMhojvdGcmnHB3rghvhc=;
        fh=IJ3DmbX7WqSp+O1U4Kh6U280IpmE2w0UXnfIR/Vn97I=;
        b=iA1PO19pdWsch2K8TENb9vF7Y9ZPY88gx3sJz6x3uOciTbe3vKQGaCLSi8N1YE1HtZ
         SxfnoWcowen2dYMg0q9ERGCYxPIDQgP6hUeJrPo2UmwVJkk5bFPzGmnw7h4AhCec11Er
         TX0d0gvWpOu/WEV3fZu1pLnW7sfPsb2oVmKNlBI2gNOJ7iFvY3wlOoeeMkhmpUqubi3b
         N436k76qgb+ze2yN7Rhd+acniEjTeDr0apADyuttE7EUM/R0MK5t6i/iodaCr1X8bHkr
         pdEgTmicv2hV61sgSZ77al2bGFpyu8eQ2bU6eEAaIeAmSccOTcBgB5iUs1bM1GR7pu5F
         l1UA==;
        darn=lfdr.de
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=gtIrKHLC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1708254243; x=1708859043; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender
         :ui-outboundreport:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykdypB+6b13qBN1CNXzXpRMrMhojvdGcmnHB3rghvhc=;
        b=hsjvQxzhbXSNq/DMCbax29kzgTZ4OPrGNfkj0GYIy/zrvW04SoAHvBJQsJSBeIqDjf
         hlGmZTi/oHYp9rmxnzS8rqM5hR8wU3eb/67goyQi3oRTqVlHCT48ZL7gx6B9Sb93c3tC
         t9f5N4qwf+Sk+qjdUkyDfE6IL0JG8DjhfPg8hrUpdr9WyEHtzzbRfeHBxPJZCCA7R9um
         dQ7ITyexEdZ+/BHeD7N/UvqRmIjis1EM+O4VfdPCPOPywtgNvO84Pa5L5n8HlDWc8HdO
         BHAjMZfa5oD1fV6t7OhHbz3UjnA2L+JlqK4Vdc9YZ2RYa77pewHuJsU2kdDlcN1sM+eq
         qN2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708254243; x=1708859043;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence:reply-to
         :x-original-authentication-results:x-original-sender
         :ui-outboundreport:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ykdypB+6b13qBN1CNXzXpRMrMhojvdGcmnHB3rghvhc=;
        b=M2by5jy32SLShfNRstANtpfdfO1uaHyeS9OIbP+XEOKbHgxZG0B+oNx1ntHLvVWVif
         qjZpyYGJOIoyJsdWwY9X8nnp7USV2oJnqyIWlO4sp5TdYj1Tmk8QyKgvQrRc5wN1aDOh
         TO+xFv75/Amuzkby5AzQ/aQFw929WTQYGVmGbvMnl1ip/o4kJNGzW7z95W3dCaRHK42u
         VFrRDW91Ol3AKB10otZEBz8khnKFQbU+5PHCt77vOs16CWKpDyCge4LlYhUV7++1AHRH
         seKAu6tY1MGJdY4llX7U5JFz7LYiHGCLOC/XXE84DkGnVfNPeUVHoVW44Iq/Z7xLYcyM
         T67g==
X-Forwarded-Encrypted: i=2; AJvYcCVNn4xqtUtOshnhSOiZVLxuDeB+IW94k7pqlurZBZSmi96YSuPC6mRTzHwF+Q8pWNYVtN7am/sEojvm7nKVtuwu9Q8kPzBfTV1b5/M=
X-Gm-Message-State: AOJu0YzQsho/A9Mh5Y5f/Ga+VFof6XNmLe6usCKt2d49NT6pxZIpL5OO
	ccY2f63kXJqoZa/0k7tdeGJ/ZOYYhHdVrlaazwD9pE0Xhmjq3n0W
X-Google-Smtp-Source: AGHT+IFuxFdMQGWEmwmU2vqG0d/qwUL4Oszblx+/bHxyRnY9gh8RJSGFbj2uqXSCneps3Wbqq69xtA==
X-Received: by 2002:a05:6512:77:b0:511:7292:c4db with SMTP id i23-20020a056512007700b005117292c4dbmr6322300lfo.12.1708254242003;
        Sun, 18 Feb 2024 03:04:02 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:600c:6006:b0:412:60d7:e009 with SMTP id
 az6-20020a05600c600600b0041260d7e009ls220140wmb.2.-pod-prod-08-eu; Sun, 18
 Feb 2024 03:03:59 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVb0ThXG9Ex65DW5M0uKNdNxULMgKwdTEWy9Yw32ZDcjbN7ccLlgguff36g1kGSuxOQ7E4Tlm/cSuPLdQgFPp9xRfcG0M4uRcz7bBQmFLc=
X-Received: by 2002:a17:906:4c42:b0:a3e:6aef:bf2a with SMTP id d2-20020a1709064c4200b00a3e6aefbf2amr773767ejw.22.1708254239283;
        Sun, 18 Feb 2024 03:03:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708254239; cv=none;
        d=google.com; s=arc-20160816;
        b=XTZpu86LfV4L/jbYja0wcRvdbhGjgkvvJNWY5RPA1obJF45fhiEvXcnXx3l0H/5tiK
         c7vTkdJZDY5beOhcUP9nNZy2NuV6k+lFd0nO/mAY6OxqLI1XzG/luGCneFYPs27BfRs2
         hPnF2m6DcpIEd+rYW47oqAmE7GwJqawmyBrvbQKDSWEd3a/bxrFqR8b8GReGAdB5kcNB
         6M4UkQ+Tpajadfsm5jPMszAjwNBSFF7f1eGBwzO1XQ+oCFfh2KNjnPORv10ipE13MOPn
         Ft3RtovuZAZikinveVyizy1xLOQClA2gepba/EbN5sW/IA5rU9cBRrWbDRBlNURy7Q5t
         LsUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=ui-outboundreport:content-transfer-encoding:in-reply-to:autocrypt
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:dkim-signature;
        bh=jHdSk/akFNlO25XPWqklmZL7YB3gF3WcR5/34vaUvLw=;
        fh=ZYufU8t05C/rWqh06LxvJ8smNawm+0A98AoemSU+uos=;
        b=wYU+56f5zxNIz6+1okdvva0lWN3CD4pReji0evnLewEYCYUJp7oF3yq7/IAPS99fas
         1KmMK5/yJKWFgJf3Ksgrvs6cHiPkhlYCVR28LF8PCytsJCSc00v8tOFIeP6zQUhBmTEP
         ksYwUoLQDVIHkgNgLvMbEoIjFww54SSxL962hbid17VEXOP0NOkme/X6r2Fzk7EpZzuo
         2D0h7FOe58dMR3dJ1Cf6L5TcvR+7pOtKKMMPld5/97oKcOfKbjXxBQsEQh7WCPVfHPCF
         Xe5ec+t8gb8CBTvc8PmRfSK3RsCbsjRapYpnvUzspYngpiAyH5hEhSjEv8m0eYB5DxH+
         eo9g==;
        dara=google.com
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=s29768273 header.b=gtIrKHLC;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [212.227.17.11])
        by gmr-mx.google.com with ESMTPS id lc24-20020a170906f91800b00a3e5c988a77si65647ejb.1.2024.02.18.03.03.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Feb 2024 03:03:59 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as permitted sender) client-ip=212.227.17.11;
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.10.10] ([46.128.234.249]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N1uAl-1qvMDX2Kdt-012Cwh; Sun, 18
 Feb 2024 12:03:58 +0100
Message-ID: <50ceb5b9-dd2e-470b-98b4-2c3b028d534d@web.de>
Date: Sun, 18 Feb 2024 12:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] configs: x86: align with recent qemu device model
Content-Language: en-US
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
 jailhouse-dev@googlegroups.com
References: <20240216193643.1524594-1-ralf.ramsauer@oth-regensburg.de>
From: "'Jan Kiszka' via Jailhouse" <jailhouse-dev@googlegroups.com>
Autocrypt: addr=jan.kiszka@web.de; keydata=
 xsDhBEq0i8QRBAD2wOxlC9m/8t/vqjm1U9yQCT6OJ2Wbv/qys9DYM0CvcOTDMWQwmV1/VsZj
 KR5YgB5NPt+To7X6x5cjz15AGnx5Fb8Wnrq8EF9ZfHMwb7YMx1LdPYPDnXr37wE3XupFmkHB
 Mes4htyX7Dz8LvKDLnli4IsAmWG+kV1JI6LWKXLpSwCg8JRq4SWoB4VCQxbH3GjntgvwNc8D
 /2q5Dj0urJ7s7sdXhrH0hcFkpSFRmU5Yd6MCwcbFHm2paL5gqVjNNUUwDBKAL9eZaQVIHKwC
 44BvNGO2gcQ26R3AuCHUQ+pZHg34tok1JCNZ6IEZccb+33Qq0qbcDMJJiDYp7ppp6ozifvc4
 YaqJECX48IydxfE9+41oV7T5vNAzA/QL/UMJyTnu5jiOXcyn5iFQw535lXkwKsqeXzCowLho
 HICZ2jITJPdTT/+9pGWwMQqST/SS35Tx4EnS3z2BWsNMCLuXCPkxF1elaMJqMfMJxFD8rAgS
 9GK6zP6fJlsA1wq/UvKSL8v4QPOnTNCVOsyqJVasGV0ZPcDfcj+ClNO4zR5KYW4gS2lzemth
 IDxqYW4ua2lzemthQHdlYi5kZT7CYAQTEQIAIAUCSrSLxAIbIwYLCQgHAwIEFQIIAwQWAgMB
 Ah4BAheAAAoJEIrUrG965ecUhIMAnR6DDCW5cx+cVdYhydbhQXqeief6AJ4p+z4+nrmZLdfU
 7V6nKqKeHeTtj87BTQRKtIvEEAgA2/PlX6oyi7dToH0CJCHq0eKmZaa7CmGaVnxyeepKvIfi
 M8n8Td76AbG64fjREMwgSpb4F/UytF3z/03tj4e49W/zKjbBRB2/wmFRlZBC9crg22Q+bgvM
 OsxnC6uHXaWN8fL+jVei/5OoHOoFqaMsX8EvploitlI/BPj+VgW26jksf3YZyk1hnclsZ/IY
 hXzgRmVJo4RiTW/YLQAkwndwc+fKPa/IYLEDW1Jc4kNLoK0P90b45zju0hpl0C00pVORTOtz
 FK9G5Ha7qOAWJfAVJORHKAkkvwftf3hkpPdLyvZUWRHXvUexmA61fLvDBAFhRxYGD8t5gz88
 SF5Tzq+0ywADBQf/YSkaYrEslPWiCA2wU6EW0yaqBQAobFsOMvsufJ6o2ntq5Ncq37VI3KCT
 67eHPE9x+zPcENoZWsRrC9S9PCf1LOsi7ybZsR13AJqDFlRzJZ4klh9QwgwFZxUBzOdIvttw
 zG1QkzHx06RKZluFYpPF3DRduSMukdIJ2wmWCU+ohB+mYefe65JGjYQfHVs8mgYVFOPxbRea
 9VJACCMuspoZWpj43UdR1lLLyIUFYz+jqcPW7Hd/GTIw4N67pYl0dwPDmFd4ohJ5g4Zpq61t
 oNysBGEuEm5GCcn0VmGtQpSYnR5cVm5b2yPz4bIuFOSuZUo/l7vitdY0iy0/wvKbBC+NK8JJ
 BBgRAgAJBQJKtIvEAhsMAAoJEIrUrG965ecULvAAoKGvxs5T3IhyQT8I8sMsyAvCE4wHAJ46
 S16yab+OxNkvOeoOEX0EnHVHaA==
In-Reply-To: <20240216193643.1524594-1-ralf.ramsauer@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"
X-Provags-ID: V03:K1:H+ZhM10kIGjIZ/H6ZJd/nBzaGlRBe2Ye/q6Qn8Q2Q9eLvy7oPon
 meXny0g2De8ZpFaq3gMmp5qKvmUyu828o+qD5IRoPT5Dt8RX7LEbdJjTbzSgC79V/pCzXJi
 MKKOrTEhgXozx5F7hR8FBEHOLRj2woxD+SGM7dfBbFouNalLSOSIgK/tjgVIT8aOgunm/Uf
 DUg50OzqAVMQvTFifWpAg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:fUISUi7RfaE=;U4FZWronSaS2m56aLXh5Cwhw8bU
 DiPBVffE19XAuD8FRLNwJZ25Pgncrki9o+UkzR1T0ysvF2nwFjbQmQqY4LBBjrjnBU1p1x2mV
 BEOWgMsVAfeLI8We1hdge7vRGOH8cGPAY0YOX8t99XMMUuev/pYK1olSFMl8JrSHawSlGkXkL
 UQ/fAy5ZoKoKnnhMJHOdKfBWjO0WZfj/ZD/Bhxs+94lwUmX4xWhmPW+pQPYoot6FPvjvoISum
 v305cXB1p+if63372CamstgPgvD198VH5YcYdmQ7R2Cu5BXt6xeh9St31+npf3alQ+kTBRE+5
 eO3U/ijpuLpVmF9678e/3JMIepReJyfZItzzye9/UE4T5UxliOe0iGE0FdoFcw/m01BK47pw/
 cKz9IiBTWOd/+NoubO81mOfpsjepK/5ejTWw+osHpT7paNRrpt3uiJCaJg4HYLpYpHX9jsAQ6
 WcXgubKZ/BHaott1k7hJBAfnm+RwFcTesftUj09zGkt5nFZkv3RmRp8Qz+t4zFPXBvkIVoCV6
 ivvBoD/KgxgDb9VOGAk4URiDR5NnPSs2l3/fiZ++C/ytXmt5fHUhsja2y4BBn0BGLSMDdp8f6
 fW8YXTdWd76o/VXhUNTqXasCSMCC01wSK0FQEujf6xJSQsOqWJgqFCSsi43go9NfZb81quHuj
 QlZKtqos7ULBIq4NrhvfPW1ok+fN1aaTHELAp6tyG9F9QcBNDM84eMYFZlVnCSQ7N7sasD32p
 CRgI8Hx75fYPRJdgXMM+mwlThfSCL3QLxRM+LzWDTuDosX4drv+A6i4Tz/IgKDY6IKATvnpe0
 ddNV4DFyKjh2PmLw9pASTCXWo2sHtd5N5343qZ9RJkkjo=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=s29768273 header.b=gtIrKHLC;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.17.11 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass
 (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=web.de
X-Original-From: Jan Kiszka <jan.kiszka@web.de>
Reply-To: Jan Kiszka <jan.kiszka@web.de>
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

On 16.02.24 20:36, Ralf Ramsauer wrote:
> Devices slightly changed with recent Qemu versions. Adapt changes of
> device topology.
>
> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
> ---
>
> Tested with jailhouse enable, create, disable + apic demo.
>
>  README.md              |  2 +-
>  configs/x86/qemu-x86.c | 80 +++++++++++++++++++++---------------------
>  2 files changed, 41 insertions(+), 41 deletions(-)
>
> diff --git a/README.md b/README.md
> index 2ab2a60a..f6fe011b 100644
> --- a/README.md
> +++ b/README.md
> @@ -255,7 +255,7 @@ https://github.com/siemens/jailhouse-images.
>
>  The included system configuration qemu-x86.c can be used to run Jailhouse in
>  QEMU/KVM virtual machine on x86 hosts (Intel and AMD are supported). Currently
> -it requires Linux 4.4 or newer on the host side. QEMU version 2.8 or newer is
> +it requires Linux 4.4 or newer on the host side. QEMU version 8.2 or newer is

I'm reluctant to bump the requirements that high, given how many distros
are on 7.2 or even 7.1. What about starting to use versioned machine
models instead? Say, 'qemu-system-x86_64 -machine pc-q35-7.0'? Similar
for the other archs (virt-x.y).

Jan

>  required.
>
>  You also need a Linux guest image with a recent kernel (tested with >= 3.9) and
> diff --git a/configs/x86/qemu-x86.c b/configs/x86/qemu-x86.c
> index cdd3dd6d..7a585bd7 100644
> --- a/configs/x86/qemu-x86.c
> +++ b/configs/x86/qemu-x86.c
> @@ -179,52 +179,52 @@ struct {
>  			.size = 0x4000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
> -		/* MemRegion: fea00000-fea3ffff : 0000:00:02.0 */
> +		/* MemRegion: feb40000-feb7ffff : 0000:00:02.0 */
>  		{
> -			.phys_start = 0xfea00000,
> -			.virt_start = 0xfea00000,
> +			.phys_start = 0xfeb40000,
> +			.virt_start = 0xfeb40000,
>  			.size = 0x40000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
> -		/* MemRegion: fea40000-fea5ffff : e1000e */
> +		/* MemRegion: feb80000-feb9ffff : e1000e */
>  		{
> -			.phys_start = 0xfea40000,
> -			.virt_start = 0xfea40000,
> +			.phys_start = 0xfeb80000,
> +			.virt_start = 0xfeb80000,
>  			.size = 0x20000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
> -		/* MemRegion: fea60000-fea7ffff : e1000e */
> +		/* MemRegion: feba0000-febbffff : e1000e */
>  		{
> -			.phys_start = 0xfea60000,
> -			.virt_start = 0xfea60000,
> +			.phys_start = 0xfeba0000,
> +			.virt_start = 0xfeba0000,
>  			.size = 0x20000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
> -		/* MemRegion: fea91000-fea93fff : e1000e */
> +		/* MemRegion: febd0000-febd3fff : e1000e */
>  		{
> -			.phys_start = 0xfea91000,
> -			.virt_start = 0xfea91000,
> +			.phys_start = 0xfebd0000,
> +			.virt_start = 0xfebd0000,
>  			.size = 0x3000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
> -		/* MemRegion: fea94000-fea97fff : 0000:00:1b.0 (ICH HD audio) */
> +		/* MemRegion: febd4000-febd7fff : 0000:00:1b.0 (ICH HD audio) */
>  		{
> -			.phys_start = 0xfea94000,
> -			.virt_start = 0xfea94000,
> +			.phys_start = 0xfebd4000,
> +			.virt_start = 0xfebd4000,
>  			.size = 0x4000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
> -		/* MemRegion: fea98000-fea98fff : 0000:00:01.0 (vesafd) */
> +		/* MemRegion: febd8000-febd8fff : 0000:00:01.0 (vesafd) */
>  		{
> -			.phys_start = 0xfea98000,
> -			.virt_start = 0xfea98000,
> +			.phys_start = 0xfebd8000,
> +			.virt_start = 0xfebd8000,
>  			.size = 0x1000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
> -		/* MemRegion: fea9a000-fea9afff : 0000:00:1f.2 (ahci) */
> +		/* MemRegion: febd9000-febd9fff : 0000:00:1f.2 (ahci) */
>  		{
> -			.phys_start = 0xfea9a000,
> -			.virt_start = 0xfea9a000,
> +			.phys_start = 0xfebd9000,
> +			.virt_start = 0xfebd9000,
>  			.size = 0x1000,
>  			.flags = JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE,
>  		},
> @@ -264,6 +264,24 @@ struct {
>  	},
>
>  	.pci_devices = {
> +		/* PCI bridge */
> +		{
> +			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
> +			.domain = 0x0000,
> +			.bdf = 0x0000,
> +			.bar_mask = {
> +				0xffffff00, 0x00000000, 0x00000000,
> +				0x00000000, 0x00000000, 0x00000000,
> +			},
> +			.caps_start = 11,
> +			.num_caps = 5,
> +			.num_msi_vectors = 1,
> +			.msi_64bits = 1,
> +			.msi_maskable = 1,
> +			.num_msix_vectors = 0,
> +			.msix_region_size = 0x0,
> +			.msix_address = 0x0,
> +		},
>  		{ /* VGA */
>  			.type = JAILHOUSE_PCI_TYPE_DEVICE,
>  			.domain = 0x0000,
> @@ -283,25 +301,7 @@ struct {
>  			.msi_64bits = 1,
>  			.num_msix_vectors = 5,
>  			.msix_region_size = 0x1000,
> -			.msix_address = 0xfea90000,
> -		},
> -		/* PCI bridge */
> -		{
> -			.type = JAILHOUSE_PCI_TYPE_BRIDGE,
> -			.domain = 0x0000,
> -			.bdf = 0x0018,
> -			.bar_mask = {
> -				0xffffff00, 0x00000000, 0x00000000,
> -				0x00000000, 0x00000000, 0x00000000,
> -			},
> -			.caps_start = 11,
> -			.num_caps = 5,
> -			.num_msi_vectors = 1,
> -			.msi_64bits = 1,
> -			.msi_maskable = 1,
> -			.num_msix_vectors = 0,
> -			.msix_region_size = 0x0,
> -			.msix_address = 0x0,
> +			.msix_address = 0xfebd0000,
>  		},
>  		{ /* ICH HD audio */
>  			.type = JAILHOUSE_PCI_TYPE_DEVICE,

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/50ceb5b9-dd2e-470b-98b4-2c3b028d534d%40web.de.
