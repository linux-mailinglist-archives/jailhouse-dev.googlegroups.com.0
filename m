Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBLXP2LXQKGQEKW6V7NI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x339.google.com (mail-wm1-x339.google.com [IPv6:2a00:1450:4864:20::339])
	by mail.lfdr.de (Postfix) with ESMTPS id 6980F11F15C
	for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Dec 2019 11:21:35 +0100 (CET)
Received: by mail-wm1-x339.google.com with SMTP id s12sf140129wmc.6
        for <lists+jailhouse-dev@lfdr.de>; Sat, 14 Dec 2019 02:21:35 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1576318895; cv=pass;
        d=google.com; s=arc-20160816;
        b=Trk/fUR+feJbNh4kJYgPftW2aPVXPI0OxoRTKf6OGEOsI1D6kudyYste2twmG7t6P8
         Sq9B/1eO5QSAu9uGqK8FmL9Q1f+gJqvclbRJnF4VtKwOt0nrfZDmFWCfKIaNBbaB5xox
         9NzvNIvvpHLH/6+HDyVsRUlUtyeAxemAVitb7hk9LVBmhOXNJ17m2AbFe2W8y/kTBi+x
         CKPq0EsGXkR+OnzXoDS6Wi402iTZHBSq922J8FXv7zntvxn0A/iIsASwMVFAg92GmtB+
         dYT/x35rONl/GzUy3n+pNDu7pbrSkg1qvph3qUC8IR3zNE2/ue6blWQ27LK6N/thqCYZ
         zunw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=yIYRPMpPW9YYYAdT2cM2uTBPFz7ma2y49FO0x/1twcs=;
        b=HMt9o/9e5qWpRu9nFdZJH6ys4of49Vi4cDqlh5EvwUP3OuevBBosQGiqzZq8IKR244
         36JKjvS3EA3ltdEYYe+XJ7pP7vwnMBvUK4kxq+K9UbdjPEU7ZAOejfor4jAjHmWg4tpn
         5GhSz1hLiBV2w1dwOpmfv0PJ8z2TKJ49M/bRJjvMJcZeiHGPR71db88eP2R/CwYjpyD2
         oGYOiKvcM1YQs5TSbxU1OhUN/2+QhR/39Vt/4B+adFC4c6+sIefUOBqx1+EdKVBsNDx1
         CkrpGtTmy1Ih7qM/815+bM3HCwm3xQquT17CbVFv4MR9zUYB9s+Av+uihFFaOtVKH04d
         LKgQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=OXYVAhPF;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=yIYRPMpPW9YYYAdT2cM2uTBPFz7ma2y49FO0x/1twcs=;
        b=r68XZtpiZAXm+hznFrbOI0veC0DofHvwIqSADmmd4bg9BUS3F9N8s+KO6NIVr0aXnE
         WWSqFbMJHuppGhNnhu/Agh80Wg4Q/Zkr21gPXjkYJIL+t5FmeGIevAUhwlsdLGpVS0vi
         GhDTP5L1Fehk19Jj0CM31W+AKnS1jHn07PPM5zt32fQZXuvDHwNKserYxWY39kaPlmWb
         xkhiRiFmb6mUlc5osF6NvK1DHZyhgOD4rfmGZaCB0y/su+PJN7D14vcCdek4H918lOm7
         7QyLJgHxp2joEjJHYGLp9zZsoDXo2duy0E3thpZjP/Q51JwLmlmbIwuOai7sVwP/ZH47
         Xjqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=yIYRPMpPW9YYYAdT2cM2uTBPFz7ma2y49FO0x/1twcs=;
        b=lyg698rMlB+ndNOWutN2SiKGMLdGYYAq1pVyF4t1WO4GifBmISAq9Vp9feH+Ktlv94
         7zgda561+C3j4/dHSvPkK0A5XjkIM1zRF/3f4gY6xT8BhfbpFQ5CyusnPy6KHSxH2oW3
         87vejcb9jtPOlANJA6HVGWvAfn7sr/FNMy1xml/L7GtEpUXcMCEfW3EF5OA2OweDdM4h
         5qU9BHGUMoUGFa+3qvzZy1ulcQwKUK4qZNc1V21h7Sst3WrhLqD46+r/7doDxvTl7rRF
         Rf9pac4oGBgu9TrS/rXKlgD1Huz4zvT+/tLdzCBtsaCXNN4VNoNGltaTO/fPQJShu1OI
         R0GA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWLhVyXyxuMyaZop4DPju3q4K6sq5DSsDxg8Wf5xuKLykrv220F
	tKYTi2uoeqfIbUakgbJ/GCg=
X-Google-Smtp-Source: APXvYqx4LrFrqq6Ix6nz87LBR9P81+R1ikS1hu7FTiA6MnDCQhWdLhP+rPEHLMbRm/Ftly0p7TwD5g==
X-Received: by 2002:a05:600c:2c13:: with SMTP id q19mr18062171wmg.144.1576318894988;
        Sat, 14 Dec 2019 02:21:34 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a1c:7409:: with SMTP id p9ls5846591wmc.4.gmail; Sat, 14 Dec
 2019 02:21:34 -0800 (PST)
X-Received: by 2002:a1c:740b:: with SMTP id p11mr19831458wmc.78.1576318894384;
        Sat, 14 Dec 2019 02:21:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576318894; cv=none;
        d=google.com; s=arc-20160816;
        b=DA628akeNPPGF6EpLCoO4Ep6bQEh+SOfgsoEfK1vVEPG20kNOsz08ze2kzYWgLCbDh
         7UEZM0KBrxZekRFDhohuqSR3ERbhJE4OmHkpRkMmN8EdHxsBm+T1osjrg2jVRaD/H8Dh
         zdLLEF6NFRP1swzFMzdxlHSNUWGb/tbM0nFp4+BcpD34ofOt2EJCSIFiaxZO3Fb64xD/
         8ZyQvF89dkeZjQVkjxDJdHWjltF545RLWd9Ta31TwaXaalDxf2AT3GtDnF3bObxioW18
         dL5b0II9qgYvuPn3TDQN7tTLhKAEjYj/CnSy+5wZH37NBi7kMOuT75pyoYC5dUwcrVXv
         XthQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=6orE0Ka2W5KjFQ7aVrUGjRr2isRO9XtjXa2Ix3Zc4e4=;
        b=UX5gCHe7xRJRW5w87MC22VF/c0QNxnz1iqQUB+WWLEZCnVHCuo1rziRGPkaDy+dWQy
         xVdt5tOPKXjhv6s2+mDFZ64ogAZzjx4ervsPPjgTtMGNZMCRaVb947au84aYY+8kisMc
         ViO/JBA/kca6+QAj6xVdjsxkRkrW/9ui0vFWniCr+7vLgEq9CZ6frTKffq8YdTSUDsee
         snqMW3lrXPgxBLGlUnRxz/1T4dvyH06HJA9d6N07LO0KT/vg7g4MAjZa10C5MAM9U3Ut
         g25QKDDYNW0VM40zZFiUSSsm99dX7NC/HS/KJ+MkYiKs81fbumX0qYeCQzxwrANs5Sp+
         iQhw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=OXYVAhPF;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.14])
        by gmr-mx.google.com with ESMTPS id b9si349320wrw.2.2019.12.14.02.21.34
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 14 Dec 2019 02:21:34 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as permitted sender) client-ip=212.227.15.14;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0Lu57G-1hfogF1YQQ-011Q5n; Sat, 14
 Dec 2019 11:21:33 +0100
Subject: Re: Zephyr as a Jailhouse inmate
To: Mani Sadhasivam <manivannanece23@gmail.com>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>, Peng Fan <peng.fan@nxp.com>
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
 <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com>
 <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
 <87131459-2a1d-91b5-21f5-3dfccd49fa81@siemens.com>
 <CANBTL1XSjDtz5OFuMUXSM0R_=nsESgHH1WFxRk9qaA2uCy0Jww@mail.gmail.com>
 <0660d2b8-b8e4-fcf2-69cf-068b9fc4a622@siemens.com>
 <a27fdb7b-0c85-d967-7c8c-81d26b0157b6@siemens.com>
 <CANBTL1XAj0ArLDjNq_2rfu8NXCp9h5i=atzhP8m2BCEhLtRVCg@mail.gmail.com>
 <0c7b7542-5f48-8f77-128e-26eee1f24ad7@siemens.com>
 <CANBTL1XmekrVLi+AfTT7oM9tZjNUcOd-7TM8KeeEH6TLSd-b0A@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@web.de>
Autocrypt: addr=jan.kiszka@web.de; prefer-encrypt=mutual; keydata=
 xsDhBEq0i8QRBAD2wOxlC9m/8t/vqjm1U9yQCT6OJ2Wbv/qys9DYM0CvcOTDMWQwmV1/VsZj
 KR5YgB5NPt+To7X6x5cjz15AGnx5Fb8Wnrq8EF9ZfHMwb7YMx1LdPYPDnXr37wE3XupFmkHB
 Mes4htyX7Dz8LvKDLnli4IsAmWG+kV1JI6LWKXLpSwCg8JRq4SWoB4VCQxbH3GjntgvwNc8D
 /2q5Dj0urJ7s7sdXhrH0hcFkpSFRmU5Yd6MCwcbFHm2paL5gqVjNNUUwDBKAL9eZaQVIHKwC
 44BvNGO2gcQ26R3AuCHUQ+pZHg34tok1JCNZ6IEZccb+33Qq0qbcDMJJiDYp7ppp6ozifvc4
 YaqJECX48IydxfE9+41oV7T5vNAzA/QL/UMJyTnu5jiOXcyn5iFQw535lXkwKsqeXzCowLho
 HICZ2jITJPdTT/+9pGWwMQqST/SS35Tx4EnS3z2BWsNMCLuXCPkxF1elaMJqMfMJxFD8rAgS
 9GK6zP6fJlsA1wq/UvKSL8v4QPOnTNCVOsyqJVasGV0ZPcDfcj+ClNO4zR5KYW4gS2lzemth
 IDxqYW4ua2lzemthQHdlYi5kZT7CYwQTEQIAIwIbIwYLCQgHAwIEFQIIAwQWAgMBAh4BAheA
 BQJOpoNtAhkBAAoJEIrUrG965ecUOPUAoK+Rh12KgCjplHAS0AoiGKwGOuq7AKDEVnBtRAoy
 VRvp3lOlOx+P2Ay56M7BTQRKtIvEEAgA2/PlX6oyi7dToH0CJCHq0eKmZaa7CmGaVnxyeepK
 vIfiM8n8Td76AbG64fjREMwgSpb4F/UytF3z/03tj4e49W/zKjbBRB2/wmFRlZBC9crg22Q+
 bgvMOsxnC6uHXaWN8fL+jVei/5OoHOoFqaMsX8EvploitlI/BPj+VgW26jksf3YZyk1hncls
 Z/IYhXzgRmVJo4RiTW/YLQAkwndwc+fKPa/IYLEDW1Jc4kNLoK0P90b45zju0hpl0C00pVOR
 TOtzFK9G5Ha7qOAWJfAVJORHKAkkvwftf3hkpPdLyvZUWRHXvUexmA61fLvDBAFhRxYGD8t5
 gz88SF5Tzq+0ywADBQf/YSkaYrEslPWiCA2wU6EW0yaqBQAobFsOMvsufJ6o2ntq5Ncq37VI
 3KCT67eHPE9x+zPcENoZWsRrC9S9PCf1LOsi7ybZsR13AJqDFlRzJZ4klh9QwgwFZxUBzOdI
 vttwzG1QkzHx06RKZluFYpPF3DRduSMukdIJ2wmWCU+ohB+mYefe65JGjYQfHVs8mgYVFOPx
 bRea9VJACCMuspoZWpj43UdR1lLLyIUFYz+jqcPW7Hd/GTIw4N67pYl0dwPDmFd4ohJ5g4Zp
 q61toNysBGEuEm5GCcn0VmGtQpSYnR5cVm5b2yPz4bIuFOSuZUo/l7vitdY0iy0/wvKbBC+N
 K8JJBBgRAgAJBQJKtIvEAhsMAAoJEIrUrG965ecULvAAoKGvxs5T3IhyQT8I8sMsyAvCE4wH
 AJ46S16yab+OxNkvOeoOEX0EnHVHaA==
Message-ID: <e7f1ff75-7fbe-d608-6fd9-6e9323037e34@web.de>
Date: Sat, 14 Dec 2019 11:21:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CANBTL1XmekrVLi+AfTT7oM9tZjNUcOd-7TM8KeeEH6TLSd-b0A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:37e27e45jV4vc9X0aRPiFdingJj8gJOYQyyEBF13vXCniGFVSj/
 TtRKbooKv/mJjr78C/8NA1QqoK7DnYtFYEX8dZr250KV40HzVYSEgQy2U326UUwCwW6/3Vs
 jQDUyNwJuogaaRL4kIDkM3qDlOrgH3/9DgK+8RDCivRE+SC+k6IZS128SfI8KdkuTIWtgwZ
 QnRjcXyldmLpR5WoJjEfg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:y9+kcxtNhxs=:jO3wWPg95GxxStESG42xsh
 J7qcToGrbniH7fcwJ42YiKyD1iWcVoFu3R0astfh8zaeTP1T5RnlQe2UTgs9TTMDxnkr/yFZn
 jhx0Rs1MBq0w4SSFR1k6FSqzno+1Kt9JNymSGW6y63hMGIj6b6cs/uS33JiE218cWN5sid5CP
 vLWW7wyOnV4W9fXU46GWFw2diqKta2i6TAwKeS8xEkZ+LoIJGlpr8h5outLqBmXEoRXVs6oQA
 cHjp+27VJ7Bq6/AJV1T3/nLccI9h0l+h7XLBEqcszLOwGaZfHKAEaduQWv4IJijOSRqGnukbn
 E3xPgprtnkheGGwDXO67oFyEij1SvZ8+6FQsYTpwooCD13XSOYh0eo8/Ycxvbwx5VP2aLYcj5
 Fs5IhCxzG7ZZ6wdFd0SmZV21PJfeBNqp0uWrFZOropx6RV0veXDa1bE4ntz+5P8rhKzDmpy2p
 vSUCsh1vbHNddaenYEjxH/V1AQLv9im2oazm9LfSMQJK9P9/+769FM4exGHKg4cBnsRE398Q2
 lfSv4chyJraufAMh5d4VPEPf+LcEEtD/ui34NIMG8sPjob7vBC9tewG4DiPebPidoy51kzd2R
 w8+0Doi96nmjvf06TVQ6Z3yjv8mxeW6Zrjx60EjBhw65esn0XJQ226DHqrQBUm7WtGOd0bFU+
 AI9LjfjaMpYckB88mrdbaBLZNLL8QzX33zpph73FjqIxv1GC/Hz4P0ZHySJPPenIvpEqVevoW
 UCX3pGgRe50u7cU70MiioPswBAYIqNmny7JDRxRX2VHV2JmUaJhLexzMeMD9gakr3WZoICiJV
 4PGHmxvv79exJYVKf57yn6++uO0pr+ul8qMvzLzm0aKfSctL1aZLnKJKdX4HYmxr/3DtifkhW
 k+NAqWAZtFliv0bMbq00HZL0PQ3crD2NbtCL1sO4WS22SBtXmVr/0gP9WdUlImU89Hv8RJr0E
 ZFkQ0NwG7bj1QyzlTWXcluixZS9r5blA/xq04fiiIsKlc7vQpq6GbWviFo78rXEB3+lSwB8QN
 Se4eVvNI575rAxNW6Jl4jkBcK8NC3XP8yJ1CRFY6fNpsYJyKFJcl+7PIolcRjWIn2Ev40kWj7
 Ybggk17rTU5Wq7HKxdRXzZyp8OiS/lSu7TP+79UPjwqFaqMo2RzW+eu+fPE10uqTrZtSZ6UFt
 kXEDvAx8ATHYXzo1BaenL2S4F4ZX7pHlPn9k6/mFlPuqgytfu6KbWY0qSn+WcM4E1ojVYeYiR
 Lpth+i4chZmN5ytj2UeX80XityJnIMwuylqZMBYfw6jdTvmfhLU4i7x7HF0o=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=OXYVAhPF;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.14 as
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

On 14.12.19 10:51, Mani Sadhasivam wrote:
>
>
> On Fri, 6 Dec, 2019, 1:39 PM Jan Kiszka, <jan.kiszka@siemens.com
> <mailto:jan.kiszka@siemens.com>> wrote:
>
>     On 05.12.19 20:32, Mani Sadhasivam wrote:
>     > Hi=C2=A0Jan,
>     >
>     > On Thu, Dec 5, 2019 at 1:38 PM Jan Kiszka <jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>
>     > <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>>
>     wrote:
>     >
>     >=C2=A0 =C2=A0 =C2=A0[re-adding the mailing list]
>     >
>     >=C2=A0 =C2=A0 =C2=A0On 05.12.19 09:07, Jan Kiszka wrote:
>     >=C2=A0 =C2=A0 =C2=A0> On 05.12.19 08:49, Mani Sadhasivam wrote:
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>> On Thu, Dec 5, 2019 at 1:09 PM Jan Kiszka
>     <jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>
>     >=C2=A0 =C2=A0 =C2=A0<mailto:jan.kiszka@siemens.com <mailto:jan.kiszk=
a@siemens.com>>
>     >=C2=A0 =C2=A0 =C2=A0>> <mailto:jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com> <mailto:jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>>>>
>     >=C2=A0 =C2=A0 =C2=A0wrote:
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0On 05.12.19 08:14, Mani Sa=
dhasivam wrote:
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0> Hi Jan,
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0> On Thu, Dec 5, 2019 at 1=
2:36 PM Jan Kiszka
>     >=C2=A0 =C2=A0 =C2=A0<jan.kiszka@siemens.com <mailto:jan.kiszka@sieme=
ns.com>
>     <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0<mailto:jan.kiszka@siemens=
.com
>     <mailto:jan.kiszka@siemens.com> <mailto:jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>>>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0> <mailto:jan.kiszka@sieme=
ns.com
>     <mailto:jan.kiszka@siemens.com>
>     >=C2=A0 =C2=A0 =C2=A0<mailto:jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>> <mailto:jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>
>     >=C2=A0 =C2=A0 =C2=A0<mailto:jan.kiszka@siemens.com <mailto:jan.kiszk=
a@siemens.com>>>>>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0wrote:
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0On 02=
.12.19 19:43, Manivannan Sadhasivam wrote:
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Hel=
lo,
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I c=
an see that the Zephyr RTOS has been
>     mentioned in
>     >=C2=A0 =C2=A0 =C2=A0the FAQ as
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> one=
 of the ported OS for non-root cells.
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Is =
there any reference code I can look into?
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0There=
 is x86 support for Zephyr as Jailhouse
>     "inmate".
>     >=C2=A0 =C2=A0 =C2=A0Check out
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0zephy=
r/boards/x86/x86_jailhouse/doc/board.rst. If you
>     >=C2=A0 =C2=A0 =C2=A0run into
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0trouble,
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0repor=
t to the communities.
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0> Ah, just noticed that it=
 got removed some=C2=A0time ago:
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0
>     >=C2=A0 =C2=A0
>     =C2=A0=C2=A0https://github.com/zephyrproject-rtos/zephyr/commit/f3611=
fdd0c8ca54a9f19bc56a14b4a2fdadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0Too bad they didn't reach =
out...
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0> But this could be helpfu=
l!
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0> =C2=A0
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0Partly. For ARM, you likel=
y don't need so may changes,
>     see below.
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0We co=
uld probably also easily support ARM, but
>     the last
>     >=C2=A0 =C2=A0 =C2=A0time this
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0quest=
ion came up, there was still not A-core
>     support in
>     >=C2=A0 =C2=A0 =C2=A0Zephyr
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0which is
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0a pre=
condition.
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0> That's what I'm trying t=
o do on IMX8M EVK in spare time.
>     >=C2=A0 =C2=A0 =C2=A0There is
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0an ongoing
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0> PR for adding Cortex-A s=
upport in Zephyr, so I'm
>     planning to
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0utilize that.
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0That is good news. If you =
combine that with the device tree
>     >=C2=A0 =C2=A0 =C2=A0description
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0for inmates, actually thos=
e for the Linux cells, you should
>     >=C2=A0 =C2=A0 =C2=A0be able to
>     >=C2=A0 =C2=A0 =C2=A0>>=C2=A0 =C2=A0 =C2=A0boot without code modifica=
tions.
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>>
>     >=C2=A0 =C2=A0 =C2=A0>> Don't we need MMU support in inmate? The curr=
ent ARMv8 PR
>     doesn't
>     >=C2=A0 =C2=A0 =C2=A0have the
>     >=C2=A0 =C2=A0 =C2=A0>> MMU support.
>     >=C2=A0 =C2=A0 =C2=A0>
>     >=C2=A0 =C2=A0 =C2=A0> Technically, we don't. Earlier versions of our=
 demo inmates were
>     >=C2=A0 =C2=A0 =C2=A0running
>     >=C2=A0 =C2=A0 =C2=A0> without MMU as well, but as that implies runni=
ng without
>     caches as
>     >=C2=A0 =C2=A0 =C2=A0well,
>     >=C2=A0 =C2=A0 =C2=A0> we changed that. In any case, the inmate start=
s in reset
>     state, means
>     >=C2=A0 =C2=A0 =C2=A0> with MMU (and caches) off.
>     >=C2=A0 =C2=A0 =C2=A0>
>     >
>     >
>     > I got it working partially(not fully though). What would be the
>     Flash and
>     > SRAM address would you recommend? The Flash start address should
>     > be 0x0 since that's the CPU default start address, how about SRAM?
>
>     I didn't play with targets where SRAM was involved so far, but I coul=
d
>     imagine that it will be easiest to map it at a location where it woul=
d
>     appear physically in exclusive use as well.
>
>
> I just got it working. FWIW, the wip commits are
> here:=C2=A0https://github.com/Mani-Sadhasivam/zephyr/commits/jailhouse
>
> There are couple of caveats though:
>
> 1. Zephyr places the vector table at the start/base address and the
> reset entry next to it. But jailhouse didn't seem to find the reset
> entry and it always tries to start from the base address. Is there any
> config option available for fixing this? Since the vector table size is
> fixed, it should be relatively simple to make it start from that address
> I believe.

You can set jailhouse_cell_desc.cpu_reset_address for that.

>
> 2. Currently the GICv3 Rdist address is hardcoded for 2nd core but in
> ideal case we should find it based on MPIDR value as done in jailhouse
> inmate demo. I'm getting faults while trying to read MPIDR_EL1 system
> register, so need to debug it.=C2=A0
>

Sounds promising! Maybe I will find some time to give it a try during
the holiday season.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e7f1ff75-7fbe-d608-6fd9-6e9323037e34%40web.de.
