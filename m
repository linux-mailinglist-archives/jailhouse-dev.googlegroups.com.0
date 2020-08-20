Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB6GO7P4QKGQEF3AZGRI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A43024C70A
	for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 23:13:29 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id t17sf764538ljg.16
        for <lists+jailhouse-dev@lfdr.de>; Thu, 20 Aug 2020 14:13:29 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1597958008; cv=pass;
        d=google.com; s=arc-20160816;
        b=OfLwFbz02hlKPyhEf00RdCpWC4hY5xH4BqHCG0pkhc1e4weVdD3Oj3Hr1/J8YBDGxR
         vDGxKW70859KiE9WjCZ/e8uRUrUcr9LUf4YYGiN74uns6aO5sf5rjVveezsjMBHg3/1e
         HCRqO3oen2YgnXcg+tkmmzKTt5uuJgaQcEVd9/K/KkI5XnaKB4WQKkCwvQcjn7WiOxlS
         WfIKWfXO0rPp7b8kVWMAcyV0e/EFe0lNvu9u7CdpY0vFOep+C9b93jE0jGYk+MIZpHC5
         CI87horaNWyyuYJVtXl2pqTAWeYbJfRj6cM7RuV1WA+nQHGnJlyzRbUN265pSC07FbOJ
         nhtw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-language:in-reply-to
         :mime-version:user-agent:date:message-id:autocrypt:from:cc
         :references:to:subject:sender:dkim-signature;
        bh=4XWm2dEEHsxfNa9E+JvJ94R9TXRE2xu00Zt7/8HpVms=;
        b=cjE5nOEjVkM12pMGRRYaYbTedrmSNhzejGJV7bdULBQ+oYj7UuCEXfmrQfWWbJFjFv
         FvimsMiwXSt/VXXks/ELpVB/5kJ/dGTZ79EUlflD+s0ggcMyVKkmvLRFrPTtKbBDxgUb
         facGF+pQv+aeGZFGUl4uDb+oSXdxrPLI5mIuN1WfLDys7fnI/76ZlZ+BPIGCi3l10ngq
         WGz5E9S7XhTNVfvS3iAYw1pa3fY+mnXoQ8sDaG+p64CUIs6eVn4aDIMD8V6thxn855Cx
         D7H0hEPCZianeWiJFSoMUR7G7qMXG/C7y0F3GoMKZW9E5ufygen+vBUNuQfXP2UmB9Vf
         YT5w==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gUj+cmfT;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:cc:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4XWm2dEEHsxfNa9E+JvJ94R9TXRE2xu00Zt7/8HpVms=;
        b=Q5Vl2of8yNv4AI7H/Pgbdp0LEcE7PK0yau1ivQdM3hz69V2FTsadXtOp8bOaNQLSpX
         2Pmkq+0RF5zr/cybDDxTag/WKyWj0mIjATtiw2XLBfLXpIzCObHVqqcag+bK//4QGmB+
         tmnWsie97dupaYi4Wp+dLCEAdnR/yU9XeZOApVvWQB2aHf7MkDfZuO1cFrUKJvhbFA7D
         NQ0fjlijZ0C3z1ThGsMZOvCX5wS39qyP44HGGMqeaiTYkXQhHdUyH8yttmbeqZP4lV6+
         A5PLMvqAvOvz95QkfWxdOOSYd8J+GPllpMoia5To2mzslyJzFlkN7Xlydtlgz6JFZD0e
         8Ulw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:cc:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=4XWm2dEEHsxfNa9E+JvJ94R9TXRE2xu00Zt7/8HpVms=;
        b=Zit+RcYSl9fxc7eWIrXKVwqVL09p4a51e5A2ptz+JOE0xKuJ5/28JHd1Rm0KEUD+U8
         4SoU8tOp0vT0Yvpgs1lOqDKgvOreHJoyYogOKgQWXO23v9AaWggbLiis35zDfIKhbhAu
         ONZZUZY+RMvdf9daFEvq0yIXYqdZATzztlYvL8U5iC5UIkJZobNfwXdzTA6ub55LOBA/
         5MfJZPcSOErB3G3VzMIsrHyBTwAK8efjipoBn19yi5j0pxGu5ih2YdbmVGwmh1EWI8M5
         29trib6uAS97JDmLHKjBpIDYLtoHmX3IH3gX/WN7SbfT96HfUaomr/PLQRBXcTYSwK3I
         bBfw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530l8auXXNk2ekUJNEpAbLJ38/TULuJVwbmEhw7q+o0n0+HO/0xl
	5qGCMgMtkEImS9L3MEWqyPI=
X-Google-Smtp-Source: ABdhPJxE2z9EztZ5K4uAtOEWkIeEbHXk0Hwctg0lBSctYw1CcYxSivvxrqV0I0UxAWzfMSspkDhWBg==
X-Received: by 2002:a19:644:: with SMTP id 65mr123858lfg.203.1597958008632;
        Thu, 20 Aug 2020 14:13:28 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:6c18:: with SMTP id h24ls729128ljc.6.gmail; Thu, 20 Aug
 2020 14:13:27 -0700 (PDT)
X-Received: by 2002:a2e:960a:: with SMTP id v10mr93386ljh.416.1597958007724;
        Thu, 20 Aug 2020 14:13:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597958007; cv=none;
        d=google.com; s=arc-20160816;
        b=hhcTxS8FY+ayDUkWU7eKx4Vn946Ky5epv8+9F3DvOys2CAUx7n3hN4SpEywCcF2Uyu
         kAq4ZTFzYjvl2A9ACVuQ02DIpO6rjamQMzUQRGaUilbpmUjautuGdxUt3bJkhYxwJEvU
         9LClewcbqaUK6lzWwTn273bPriHDqE4Iv7Rs04gb+17sdYp7dQfAfm0n2hgfE9JMrL3X
         Y4cqEsFT97U8UXwHJn2L0ielISTQ4g+AT14fNfYwzjqXEwP83uL4Hl1ffoS4IZcJIl/N
         fQrW8mjSKvu5M/pIZJkQoxNpCBMQ6bekwosS3lXmpP3YGaaDRF7jA7CYAPtIAISnYso3
         Wu1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:cc:references:to:subject
         :dkim-signature;
        bh=ElFVVpEiDllpz2tZe8X49mfXyFk8rqDNgOPjmrEj5FA=;
        b=M3Mo9YYKdWeyLsvn8OUzpoPyDYUV4A0coY5oK5FYrATNFiwXfuSq5s2mhi4eCI98V7
         Vzpm9Rpz2WzWUyrBpWyouiYN2m9JcGmIyTlscOjOPNeu2NFt7OWNVR+/Ip8upV/mGhgH
         tLlh/FGnxCIh6i1iNdKG1QBfp0lgvxKOn3tC0DYc6xUAR5t+xsSHSfaHlNmZIEob+HMw
         6rJ5AvRIg//TTgQZHSzHB8/T3R9O7bhYAiNpd1HuQo5NS/rRaNUuof1kCGUH3euHBIen
         jSgYvn29hxRbrs3AuThPxmQN0+UiUJTh0/YMmNlXhmLOowBVdMtnP6UN2G5upovLDhvT
         gdBw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=gUj+cmfT;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id z14si90229ljj.4.2020.08.20.14.13.27
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2020 14:13:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.10.10] ([88.215.87.113]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1MnFy4-1kXzTV2D24-00j7UF; Thu, 20
 Aug 2020 23:13:25 +0200
Subject: Re: Build jailhouse on embedded target
To: stranzjanmarc@gmail.com, Jailhouse <jailhouse-dev@googlegroups.com>
References: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
Cc: =?UTF-8?B?SmFrdWIgTHXFvm7DvQ==?= <jakub@luzny.cz>
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
Message-ID: <a9dc46fa-7799-879a-11be-b5e3d64a7a12@web.de>
Date: Thu, 20 Aug 2020 23:13:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <bccfc16d-0fb3-47e7-8a25-9c85ebf4b5e6o@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
X-Provags-ID: V03:K1:79cvJIZQWqbqhl8R8cJ259mzLIbHhM+sUYNFqpYNTkQVCkfSXJ/
 EPJYsSbieikP8HzQ0M8kUQAJ0ehg4DIz5S0AULXN0D1LZDjfYUIBzurmV1Sq959S+wuWW+c
 +s/Am2zODh9zGqD9XlwDyMr4d1dIOnLDLYIbxnTaKCMvP3RDlh/V/ds1jiJ/Qm99ofxa34C
 aUM9ejXPBxgorXVXk+hEA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:K/0NYQTRB3M=:/6Z8VvbxS3JRo4MqWEGTZT
 ftv3CWn6yseew+6CaYj03r6aTeTfpSqYwbOJdWWoZqLqrAEL9k/ABbIhvuvTB1QpKvEEPh4uE
 UGqUrqsPAZBhF/qLbvL79+zORMLCIJz/GK/U8eOCEqqRelyS7IS40/gp1zKVX9Soy3HB6tMsX
 VZq5mtHvqn56C7CzlMT+luuQQbUXADTYVUkB7frCdskzzjVJgC4jCgY6ZAbpBeucB5I7XZMN6
 DkJn/t54mq5ZhNXTcFKt8bbz1xsukUloIPNl66Ix8B/6qMdBpfyHAWWErCciXZV90C/w+Artl
 IHGFvwRIxTJb+PrXk+UWXc6ciOngq1Kre/pGVajMlHK3ooKeTyNI/wVNPvjnD+9kBJK3PpF0K
 7DtLNeqxVZxyQ+tBFoJSdjr+P8tC9Ve1OQj7dNAtbvBgh24kbaZYsX35C/tMLXwh8puu+zPVf
 fpiSM5w8DKKokV1W305yrpEk2ozpyelB9rSyAQEcLNvwevxCr1GtWbQq5kIOJ6W6TsmF+s6Sj
 1dEHfnOc29NuZXhjJHRGEYrlMjn4/5FDbCDh6O4ZOFU0N1TLWfdmYJf4wYr57Y4qHwOmpWi7a
 xsc5LKUyqAmmRcD1AazcAdxsWOhszS/o7vRdwYkR5pC0Uw7cNw8Ffgv7v/ReDwkdyvja6olh8
 GMBbr/nsscY2wn5MCGs5+yiDu/Nz+0DXHkSqpifLW5g8cW8EbBuMcdGzxzCkggvUPiImdW0+V
 jCire6qbBKLJS12tIngxGqL0VTHfcIEgyZbSXLLvwjsRnghYHadQ1peNigAYFJRlWyUlybHYv
 taS7BmwC8SYUZElSvvJ33DAcora2xcNOSiZO2f11APdq/0Z1rChodwxu1OWpKdF7YD0/I2+/D
 +j/RVZHt7h18SVqyCizPvHqt1jDXQ6x5t9fueeolZcGGyF29bWVEuHfmPCLGr1E1bnssWVcBe
 AMPt49p2YEInPnh6tHa91vvaVE80S857T9t3DPtHnlKkz3uMQ3RFITO/rtrYX4xMSG4XTFwHZ
 VPdrtz4lfaul9QiFRATF8+yd0/AHCAYgBvyF0MsfdoGmH92tCDry6CNwsX2SEYAlWnKwIZkre
 EBdvu3C7j4Bq/SlHouYZ9Fu1OUPIWdpx50O7nHxTQfWyqElvemwtTFaS/Koys7Oxv6eC/d/0Q
 0BM8Fir5jjyU/Qhvs+3II34by8FMaytzCQ40e82MhbiAm/uo0x/5v8qtZ7TPi6W1+Vx32rA1l
 YjP53hHan2EwkXYG1YhAadzclTsIHRLtk01yJ7w==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=gUj+cmfT;       spf=pass
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

On 20.08.20 19:48, stranzjanmarc@gmail.com wrote:
> I have an "embedded" target with a dual core Q7 CPU module.
> For this target I created a BSP (Linux kernel, root FS incl. compiler,
> kernel sources) with the help of Yocto.
> (make: 4.2.1, gcc: 8.3.0, linux kernel: 4.14.111)
>
> If I run "make -k", I get the following errors:
>
> ...
> make[3]: *** No rule to make target
> '/gins/data/Jailhouse/jailhouse.git/driver/cell.o', needed by
> '/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
> make[3]: *** No rule to make target
> '/gins/data/Jailhouse/jailhouse.git/driver/main.o', needed by
> '/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
> make[3]: *** No rule to make target
> '/gins/data/Jailhouse/jailhouse.git/driver/sysfs.o', needed by
> '/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
> make[3]: *** No rule to make target
> '/gins/data/Jailhouse/jailhouse.git/driver/pci.o', needed by
> '/gins/data/Jailhouse/jailhouse.git/driver/jailhouse.o'.
> make[3]: Target '__build' not remade because of errors.
> make[2]: *** [scripts/Makefile.build:585:
> /gins/data/Jailhouse/jailhouse.git/driver] Error 2
> ...
>
> I think that somehow concerns the topic "build kernel module out of tree".
>
> The build process works fine on a Linux PC with Ubuntu.
> So there must be something missing in the root FS ...
>
> Unfortunately, I am not so familiar with this topic, hence my question
> for a hint.
>

You may find useful pattern at

https://gerrit.automotivelinux.org/gerrit/gitweb?p=AGL/meta-agl-devel.git;a=tree;f=meta-agl-jailhouse/recipes-extended/jailhouse;h=34ed31b08046cb02ba13a93e27cd0d3f74f87305;hb=HEAD

Or sync with Jakub (in CC) who just wrote that layer.

Jan

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/a9dc46fa-7799-879a-11be-b5e3d64a7a12%40web.de.
