Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB4PJSX5AKGQEXEKQSVA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13e.google.com (mail-lf1-x13e.google.com [IPv6:2a00:1450:4864:20::13e])
	by mail.lfdr.de (Postfix) with ESMTPS id 96050252206
	for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 22:30:42 +0200 (CEST)
Received: by mail-lf1-x13e.google.com with SMTP id x13sf13332lfr.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 25 Aug 2020 13:30:42 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1598387442; cv=pass;
        d=google.com; s=arc-20160816;
        b=PJ4g/JWByEjDChrkujytrGBmcMMNYy+3Qa3LzA/ZS86/xDLbyL1tLK+0dCoVSU67bz
         9km/A141ULEMi1alXapu9Dqjhl2V+1DFmmdC7QIgxUkIiyrFTiYwFQmYyATx6xniL1HF
         7YTP//WmC4CAxdRXaZ0jUyOINh2J4CQYbDNou345L2QAYfLVM9T7jDvRzqGATjTAIqs7
         VG5C+3/GseuEn3U725BZkh9Udyynktv5FnZufENemcyPGjuRtU25Ix7GAZhvKbAkwYqP
         a5JrZ/0LT7WxhlzVCwJeYclvmq9K06UOTQBQHgiUzIRiQjYZu5AzAo8j5em0Zy35M0EH
         GSMQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=+vv+HlqtbXE5dd7h5gdIPweSdgJPsRVuKadY8Ff2wvg=;
        b=s44kg9dqrEcilatdMa1K6PXizAbIbWZSdzdi7Y/AUp46vJjRjVHxDFo+KXEnBRSCiQ
         NlKeWp3kwXDfy3G218VLWHU4qKbevwCZiPUC9jf/ffckQM3h4KfAa7cx3PlIaEf0Yv7x
         ow0nX+wh7wZHrjghegHFHUhRprdMogAlZJcfvkNL6eJ8dILKTPA4Uu4o7rpukT3iWpW1
         7G0CgPBp7yDwqlmXXQQUfpm99hgOwi52yA+y89J2xuiZ8gd9cOKgod3pxcQeB6oNzSIA
         djOTD6+DbeItyZiV7CgcRhuwlFa040Ihcm7RMo7u/Vo+7al952yvVN9awyCX1QEsid6p
         HzTw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nIKvL5U2;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=+vv+HlqtbXE5dd7h5gdIPweSdgJPsRVuKadY8Ff2wvg=;
        b=puosO37v0glz5Xm+zqpuQa5Q4mQc+0dnGRXH9yqvNwvl5uDVBUvrS6Zo4lBdOBWO6L
         SDacxUGBAESPeZtWeC+SWNHJ7nw5GeKq2EjjTiXzi/MVIhlLP+wr0BUwqYvIiQbimPqd
         8hjXREYL7rLZ+XOlKTIlc2gSY6BkBCil3MBYHzHX3O43tKn5sCX3FSUC0ih4XVVhnsnR
         rB/C6ezf3Yw7EEzo5pSjsr2IHMl17j0b62k4u9YuNiiDDM+81MRqWyg836ACurRPHhXN
         Vdb/kLzcGsQ6zGKez5w5x4cRbb5bfxU6M26oDMe57mGIYcLjTbOJxsNCIFfLmCvyvGU1
         GOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=+vv+HlqtbXE5dd7h5gdIPweSdgJPsRVuKadY8Ff2wvg=;
        b=VH5iQ4mOsPt4MnWO5xIBpWT4vhbK4e3BEoxSs5gQ++GOlmS8+9KekHbtlusgKmItOl
         gTqJYhwXW5hgIQeTH4kiGl6cH4OSj7lVNHJ1lPPQ1KqjDkf1sHp7ceFV5Ng9lq7JCL9u
         Du+9ns6AGoO9vrDPgMHXKmwdaFe7miJ+N+XoxF96B2wPImnXFjlO1P8ALvT+IaeM4Baq
         S125O7Xz2VrfTteSFdDY4QqYAG1M930DKKjdgGV6M11FeA9Afk1n4oTEni/IyBAuLE7b
         5A5uL23P8lpM8XjEmaWxYXYwuxAR0zSXqaXjV594hV5mciDYb59sZFpsiAnRdyEhPU5w
         33iA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531oHmpClg1PUy5i3blp+c1qkEPsmBBmfazF8ypud2rKn82eZ3Ws
	xIC6Xttxl8EFKy5+y8yNHuo=
X-Google-Smtp-Source: ABdhPJy1X1PutgZozj1ULgf+WAqP3jR52oK4855GOmiuIgf2/Fx0k+nQKM9Z8PzS2+B/N+fPyZ0ffg==
X-Received: by 2002:a05:6512:3156:: with SMTP id s22mr5633783lfi.140.1598387441482;
        Tue, 25 Aug 2020 13:30:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a19:d46:: with SMTP id 67ls1395711lfn.3.gmail; Tue, 25 Aug
 2020 13:30:39 -0700 (PDT)
X-Received: by 2002:a19:6e45:: with SMTP id q5mr5690815lfk.104.1598387439754;
        Tue, 25 Aug 2020 13:30:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598387439; cv=none;
        d=google.com; s=arc-20160816;
        b=YFN2NVkSrhVEYkyOZw+WQm3HyaMmw9kaeKbvl9A8cDMi6mLaFAhpa9ZH/XlgSKrajO
         vNcYp9/NPriZzjeJSLFPLHqwK1tqgaF3CwTzUkeR0RalGgVqQFtvRxlBJt5cYy2O/gyY
         n5JUAuWI7OTzPTI/N9ZOf1BeV+ujIjPnb5vDyRYQbQ2Bzmqr4e3KADiymi+x1av3nG4F
         Pyx36O7/wo5C417ZPl3hnpUbkfUR/Nbkqpzxh3kd468724it7K0PgCIYySvT7H9XpiTQ
         PBAHLDGbqhnCGD+8Uv+ui1zCWYFnK5csOt7kuRizXIyffJqm7fcAkHVxSrBSrl9jZ6Jt
         i40g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=t3CHHv6wISPabKUPclzDuKu4GzFt0kpF5qnDe2XVyTA=;
        b=rNxYc9E0A2PZig/FanhVV5POgOBeGDZThPmT2Az/yEdEzj9IcY4/IGxG7GM76kkEE2
         z0/0O97o7eYXvCzdhXA9hhU8ZUWWtt7vWjBCdE1Q7drCJYh75sGb+/fh+xcNXmP+Kndj
         tfvxYbGyrFWsYwXBLZ6wkQoNZHEr2xGrtTESox8cRemnw0Av4L4TDQsWHBS1uZ1fto0g
         FU/kPgjz5rJ84j+QST6MtWMUVtKmNW/2wSeydek026i8I2BLLOgx94RX6Cg/f/AVWY0D
         2pJNjCMGCyS6Vu37Ko3IlNDfdzGsdqEJ20Q++YSEFnmDNzv+fmn8hBTqZu/bG2hlcdAl
         H/gA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=nIKvL5U2;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id z22si47lfd.1.2020.08.25.13.30.39
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2020 13:30:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MjxeO-1kuygg1CQq-00kE3k; Tue, 25
 Aug 2020 22:30:38 +0200
Subject: Re: Libvirt driver for Jailhouse- Test set up in jailhouse demo-image
To: Prakhar Bansal <prakharbansal0910@gmail.com>
Cc: jailhouse-dev@googlegroups.com
References: <CAD6ScS_uBX7NCU+VinzamffEFH_kfh4B-MfR8nxt7+5VuNpRUA@mail.gmail.com>
 <0d84ce9a-60dd-c81e-d879-a278c8602054@web.de>
 <CAD6ScS-U0Rh_yWeH-DhRXT587ndXpJZ1m9=9-_uDOGPehzHWhw@mail.gmail.com>
 <CAD6ScS-LvNcQ0b6f-NxYuVQqYD8c-zL416WoGhB9igcMAbDRsw@mail.gmail.com>
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
Message-ID: <5e559037-4e6f-de48-93e3-4f53fca22666@web.de>
Date: Tue, 25 Aug 2020 22:30:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAD6ScS-LvNcQ0b6f-NxYuVQqYD8c-zL416WoGhB9igcMAbDRsw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Lu3RaoE67iNv2UlAtXiUSkqGZlEONjsJoogaUsqAcpg8C1efjXG
 6zTVY5Bha5xS6nmFuNR68KJZagUrPBtQG+n8bt3S+O2iCskfHginci8Yptd2x+dvzSTyc2C
 8MIDZXP13PWF0hiSoAsDdLmmhnaZnN4TMkIFpEhJikpSqHXdCc+5nRGfkW2QWv5qOLtVbRx
 YZXfwp1kHm6S2eU5dv2sA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:kaF0cnzWMk8=:KBLQhP6U64dfdqW6hqPJEl
 dMedWyHTWKSMnOHbHwZlK4SdklE/gF8ITQOIMGZMg97marao7cptj0hljOUjP7ls1JauniOj9
 KoFqj25Kui9vnEWV1J7P9CGOXZcoEmmY3d0Hct4nukJ/w6t7cdyw4etvgqY9pzx/haoeV1W4r
 jUu4B1963KM9rEmG9iV9Oj7H3C6IIv4zcYj22+M4hI/7kKVZpMxALIuCdXJqbcgtFuusvt0VG
 kg8HeAo58lnFEiiUt152v1fXbEVl1R25a/VJV5CxPhC//3LK8CA+GrmfgAWiDU39LxiX3BVEq
 xn1PrtbErsKW8XEmknElNWczbwuNDbK0nHbV8bnDHaTzksVO6aYsMEPhCEe09MX0xC9AxBEx9
 zaTWk+c7qIcQP9VvUrR47PrX3YkqO16IP9J/3Hogq7a8LNXHwsql6piAtE7oRzQrQLtqvT5R6
 9A9csZCO20/MXA4kky2U1m4VHqyFlbIsmOaa1CzavMxGn4C7i+kaFXWddAVuY5n2KJWnlrw3T
 3ZP+IxTJeKvgDE3e09yBDKwr7Yayr9BcELQ5Zauaql0nrlEHUhjWgHGgpwkVufnuTnnFDc7Vd
 ylMqqXaGSbOYtPtYds2kw4h75Ltpn9its9K0wpHC/G08oGp1WXaQ0XM+1HaYC2jE9ldp5Q24I
 lMOi6BTNTe4MEm53KF/qcYWx8xsGnR27Z+cQPi4SVMU3JejMeNVUHLrEmaX2dRPFeFYOdStLG
 4RnHmcCvH/055Ieh1QPEtPEMCu9YM6nFMOAjKi1Kx3KzzuAN18kqhF+l9FSLB927jwazRPStU
 FTXihwyFOx3v3B5KFxcY+UoN/x178/W8ZuZSQDnkPmnuBfTbpYGCRVGL0p8j4E8rhdWHs9Bnb
 8OD8UF8JMEF0v0awPMOKyVwm4B7N+VXs1jF4w0MCbxERbyNFk4muJZuq3RRkzre4W/MJg9IXP
 XVlhLkco3EZaOFUCy8V6VDW54c4+D/NwsHko6IaLK7rLRI13Z0/KEPKBFj+j1JHc9lQzYdnb2
 EzBz4qfvWW3TT4usw/IU8ImxGXh0sE2uG4127qHfdmQeHnhzzMJb+4MEL3CYnuz66GYB7F+bm
 aBUzG6uDggPYBIGa8Ts/p/gaMguPeLdOzQms9oVzcSkT3gQl9WGKYivqDcYrqy0rxLMPGbWf/
 4Lv32MK+5bNq9/lvN8ZJFnd4OU2XoJdZyA0iKHSGistfFUHCl93hZ+UMZUm5BYc9wbbO2cibn
 ZbJqbCVftvgKx5ZN7DdMLfjBWJx0xvzlwhQy8paIHi8nIft4mAu+NG30MGicRdXrKdZCWhew5
 4eBXK5li6SRPE9OgVX2oCw7oaCUgOLvAirrVIODDSXBzkPMYeaLm2hV81Zhy5co0IMllLUZ54
 Ut0J6ynBC3nzFdyF3CLAA==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=nIKvL5U2;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted
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

On 25.08.20 21:51, Prakhar Bansal wrote:
> Hi Jan,
>
> Could you please suggest how can I increase the RAM for jailhouse-image?
> As it is 1GB by default, I need to increase it to build libvirt using
> new meson build system in libvirt.

You can temporarily increase it by appending, e.g., "-m 4G" to the
start-qemu.sh command. Note, though, that the Jailhouse config is not
prepared for that, so you should avoid starting Jailhouse in such a VM.
So, drop the switch again once your build is done.

Jan

>
> Thanks,
> Prakhar
>
> On Tue, Jul 21, 2020 at 11:32 PM Prakhar Bansal
> <prakharbansal0910@gmail.com <mailto:prakharbansal0910@gmail.com>> wrote:
>
>     Thank you, Jan.
>     It works.
>
>     Thanks,
>     Prakhar
>
>     On Tue, Jul 21, 2020 at 2:12 AM Jan Kiszka <jan.kiszka@web.de
>     <mailto:jan.kiszka@web.de>> wrote:
>
>         On 21.07.20 10:14, Prakhar Bansal wrote:
>         > Hi Jan,
>         >
>         > I am not able to set up the test environment by mounting host
>         folders
>         > into the jailhouse demo image- QEMU/KVM Intel-x86 virtual
>         target, as you
>         > suggested last week. Since this demo-image is created directly
>         from
>         > QEMU-system and not by using Libvirt, I can't manage it through
>         > virsh/virt-manager.
>         > Also, the space in demo-image is not enough to build Libvirt
>         inside it.
>         > Please help with the setting up the test environment=C2=A0for
>         testing the
>         > driver in the demo-image.
>
>         Try
>
>         start-qemu.sh x86 \
>         =C2=A0 =C2=A0-fsdev local,path=3D/some/host/path/,security_model=
=3Dnone,id=3Dvfs \
>         =C2=A0 =C2=A0-device virtio-9p-pci,addr=3D1f.7,mount_tag=3Dhost,f=
sdev=3Dvfs
>
>         and mount the host inside the guest like this
>
>         mount -t 9p -o trans=3Dvirtio host /mnt
>
>         Jan
>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/5e559037-4e6f-de48-93e3-4f53fca22666%40web.de.
