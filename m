Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB2U46LWAKGQEJCWG6RI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B456CFB48
	for <lists+jailhouse-dev@lfdr.de>; Tue,  8 Oct 2019 15:26:03 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id w4sf2231866lfl.17
        for <lists+jailhouse-dev@lfdr.de>; Tue, 08 Oct 2019 06:26:03 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1570541162; cv=pass;
        d=google.com; s=arc-20160816;
        b=u5Df/s+FM3ykFAyeKRSoujgs6x0NOkMGYzKPkqvYZYRK0Ts/ZyehJzF0YNBTnQw/xK
         BYKYk/4iu5ddJOwWCiEcXoN5V4j1xH+flHU/AJWavY7kgbiidr/flxN1W7tRYipdGfzF
         uW/7mdEFuDS0O6QvN4bZMQ/yaHPtOZoc8Vlg06HgVbv/8vNh97fE3vpFQF8FJAE6+LYC
         VIOor3OP0B1RhHHmn4Kk2LZTIKD1pv0Msba8+w+Msc3RqDkShwrftYwBBWbuZLHQ0NDj
         mWmZuAeSqzHpFMMnm5kC65Y44LVEXJJUz8LuO/gX8xOTZmybDkhwXV5MDo4llDjVxnWl
         iIgg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:autocrypt:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=zNKndgrGb8ztS+gE8TUkzlv2LLWEIbmdB62qJzJutsg=;
        b=bvWUYBH1L6gXsOomx8CABt7P5HhdWUZkSooyg47oKHqSOJAUIm8ghyTupwXwZkjdmI
         3WvzSkLJEDG8jjsQqrRkpHGThkNta4Xj209CWV1eCFsu5ylRRjY++rFf7U4Yjpoalihg
         rYo0Y6RfdYJpBSaTO/LTveEK+5eY1JqAzygDNpJ4soTs8VGoY3KIb3mpWnvE8im38Qmp
         RACdmDyDujy34neDUxr5d9u1zji/2vF7fYhGUAft8tLlpPdF/0bs+tY5mAU5uqAc+e+M
         q2LEmTPoTmpv2rM1NqNXJUUeSTEabkrAkzCLW+p3OOwJgGnWXyVP41Wel2h1Lt2UiSQH
         7rcw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="d/fNYdsZ";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=zNKndgrGb8ztS+gE8TUkzlv2LLWEIbmdB62qJzJutsg=;
        b=Nj4igaAXzC3YFqq7QiEN/XBXes0SUWpW49/DfDnpAK9RGKZhOvYVnyl80w82xJD3HE
         bv18YzwZn+R9yochwAVSsoHiCVXRHYOeKEh4ikpcUMV6ODVUHN8qdz16mE6nji7h0XQk
         8UHbathlABFtQQSLNOOYiwglzCMBQJs1+kNLKYgwnhw1vqCCnj96WhGpShqA2fFyf/RG
         nkiBPJUpv2L4VQHAVcMGlrucqa84C/xajsrPptBrP+DAOgDl6YVGFucwNA+t+2w9S/kq
         C0yaOGgwl4N9vPEDPLZkUHhtpJ/R+axb6ExbJKt2HEWgGNQzV3l93UvXIrOAQdBGs1zB
         /EOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=zNKndgrGb8ztS+gE8TUkzlv2LLWEIbmdB62qJzJutsg=;
        b=AyP2iuSl8P+MuAIOZ19MJ3FqVE/qi0ODCZqUPhSrbNuoF3z8KmF4RNRJ5CWb5zY6Gi
         eL2AhkMf8OrEKwVnmaqQjoSBipHLZOG/aE8T+Gy0iwRVDBShq2GDpdNhlaqZNyjVL5/Q
         GGA+kz6qpV+b03OVBy9JidYVHJZFzDPqAtF3nhOOEWqMZjMJ7FDd+67nTBKOgYzyiJFw
         Ul5lnU5dJockEnzD+QDzcsMSeMltx2YC/aTJHw/Ffjle5DynR+fbVv9ZEuArDIRwBLZk
         CzdKdu0MbaDHAoEXMyVdtGHo1qlbV257ubA9ONCrKclfUBMrbN9KvWuzOR2aLK0qb6Yw
         XNiQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAXNWSyGS3OkGuPTSkApb7zc546RjenBb5NksFDH3CmPZK8nep29
	GL4Xto+3oEwFu4RhNC878rw=
X-Google-Smtp-Source: APXvYqwc6RFQmf37MI+uh2JEOXUcdJ4Loq9QMQ2qWqQTn8c6hsyISiiUoJmmXQY5/h4Tj6kYdXT8Nw==
X-Received: by 2002:ac2:44c8:: with SMTP id d8mr20704085lfm.101.1570541162774;
        Tue, 08 Oct 2019 06:26:02 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:42d1:: with SMTP id n17ls297008lfl.5.gmail; Tue, 08 Oct
 2019 06:26:02 -0700 (PDT)
X-Received: by 2002:a19:4912:: with SMTP id w18mr20005250lfa.93.1570541162032;
        Tue, 08 Oct 2019 06:26:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570541162; cv=none;
        d=google.com; s=arc-20160816;
        b=Q3PPU5B95z73ODRDzkrxzUpEzUajI3geFoPx4BVghz4ChSpdHMsRN0azzygYdOyVZ5
         3m6iHhvsKev8CKIL8CyCA4UoJe3f68g47bkOyZE5ffI4eW+OovkKsomzae9wjn6N4D93
         kzpn5F3VC3sxE0ICX7UA6q7gg16T+cFWclKGSj42jCselXj9Se7inXc/ra5ew0ZnpOvN
         EGZsz58oLJlbTRRitgUNbVwnahkHxdxKg4HpCCi6f27RVPWY0oPMgsA+YdRfTyrGB98y
         ZogoXacyKcpMLD6qUHRAvmaQOBcsY2pOpHwBgCbaeSm4ZgLamafBtlr9iTehXi5POwym
         LYNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:from:references:cc:to:subject
         :dkim-signature;
        bh=4MsliqmFNOsLQN9LbMEH/JqiAqExHQ1xD4oZaWVxu0I=;
        b=bT9pAeb8J6/+lR+xaQI1obOown7Ys9Lm6C1eBgshBZejjJbMkkmo7fkHMRi9ZPqeN5
         dc80TH0Q+/1xRF88L+LtR7NKQUjOgH0Wgk8zBV6B2OJlUElq8XzzYdUN0UhOyMbpq4Pe
         QUao4JBuGmkfhlFQc4Pl+5eCcAONEezSkOQm/vCm3EvJcjqkJAcaj6xaunuhSdxB03QH
         f+FtGoTy6n8wgPjJOmI1o4XnceqMKHQT1lojTrIzMPamRQanjPVdXbVrUUO/GdWwMc56
         coiNVwLS1z9ALAo2ZafFqdAN/F6Hzq72MAqlj3yAdDNDmYv25cKECWMWsXXLDqLWMfHW
         e5GA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b="d/fNYdsZ";
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.4])
        by gmr-mx.google.com with ESMTPS id c25si1147940lji.2.2019.10.08.06.26.01
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Oct 2019 06:26:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.4 as permitted sender) client-ip=212.227.15.4;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [139.25.68.37] ([95.157.55.156]) by smtp.web.de (mrweb004
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0MgIMg-1iUYfO1uIY-00Njpn; Tue, 08
 Oct 2019 15:26:00 +0200
Subject: Re: [PATCH] driver: sysfs: fix parameter usage
To: "K. Kahurani" <k.kahurani@gmail.com>,
 Henning Schild <henning.schild@siemens.com>,
 Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
Cc: Jailhouse <jailhouse-dev@googlegroups.com>
References: <20190920145644.2169824-1-ralf.ramsauer@oth-regensburg.de>
 <3814a06c-155f-a3f0-9c54-bb2246e19e80@oth-regensburg.de>
 <20190920181658.64f710cf@md1za8fc.ad001.siemens.net>
 <54df428a-f4c7-fbc0-d641-cbd31c921405@web.de>
 <217cafa7-e132-e17c-adb0-440d3df88135@gmail.com>
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
Message-ID: <e1bd27ee-8d2f-b25d-6553-6557f9bd3ba6@web.de>
Date: Tue, 8 Oct 2019 15:25:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <217cafa7-e132-e17c-adb0-440d3df88135@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:xFXCfjTHOC7shf/Nd8QZQbuCO9MwvjXfZ92kI+LxIGl9t17V0mj
 EJ1v9g7qfz0Zq5tz4gbImLUSiy3f0qiw+oDN8tpd0dMds2xaenz3/jH0K1NpPUgHW7kVG66
 NDo9sGGJ2BEdygZ5tUv2MCrphNgemGbCGF61kdhBNPQO2WHnbZqayjPsAsHLgLx1EFJ9+tZ
 Zl7XHtn4wWKRvqocqu1NQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6UpFfdh43Uw=:MYj27I+03IJztWKyCEucWz
 m7gRW/dqJBWs6t6oBsdVXhjTI0E/sZDeEwzKElOxJFBi8BqbDl2NVJYZTSmNWF4Qrat/UeRjK
 rbgP+uqT3r3DkCpmGOc/L6lJ9td5EJY7rtWY3FuSc+E0ESAwYobIzE/l5x0KM8gH8CKoXxGts
 2MrwurxUMWZr0TZqY2xTABjBjRUh41EyF8nGtKaN8EbBahxOjWETZyQwMnwYoCDYJK+2YSHZq
 vPuFTAPbip6P3P/PmXpZsEu70HopqfDCvVVLK1AHzMtlltuO5RP/9n7850otOdLs3n8/2jktl
 i//NrwWb6SBgAZGGmrYANp/jGPw8XFJPpC1YZgjBEyDSRgcEPLmyxswGkXD204xon/Vi2PKrh
 QPXG4bL1t5OGLAUK7RF1BHlgzqonTguDyGZSLvUb3CKIN2JpD1oBglvNRx2+Og1kSf1FY/Bhv
 vlgMYalQYZUWkPtg8oAoOWY5r5g5ge26+jXGn6rW4xfuLZKEmW/KZWrUTKopEiz63kXlZ++wY
 mwcDTO2bnNTIjddEB7Gi2A/PSlp8YAbQh5fSO4GhfXA1BpiGO4kuJDOAjDCDaSUqg76jc8Z1M
 eDLgbzT1nvezmVoXee2C2OD/AH9XevgtZIakDFUd7Yd8OP/Yd6oUfafUONnY6BiFHVgG66VYS
 5dnUz/m1VYgJq2PI2DMQ8WG//BQ48RLos7etOk4jTM9xuCKLaAyoLvhD0cp1qrcKOWzK/EBrf
 r1S1I+7QwcZP3whJKA8bhYA58a9fvj0k9R0ME8lVqT236yEV0+C+56ZG2ipffAkJ7PZM2O8P7
 hDoUuyz1wDe+rg4TEl9qs3Oo+xYMORl2/bouVyCkXg7W4sS72o/4sC7jXnsOoJCGcdQscOK3i
 veoybEJDDj1ABvF3ryguVwPcFYEhLWOcQTNzUDoWqINxNLIJACXFuDXElM2X8mZYwlJtzpRQX
 2Ts0gubiWLEcgRNWv2ZM+jSP4XlXv/eXY2cGm3xx/f3Axo0wlZx1tU/gTl/u0ADzLuQUFV0ju
 xLNgUcq86pI72og2e33FjAG7CAN4kPhIUtFF0cj/gmRFAq1Oi+CmNYT4sFP73rLwar4OYKzkk
 aLYcJK6QloM+xPMimUTciIrOwDdJyd2o4NP5HModb1QGM1USOrMx6cmqhGL40d4j7XtfDYPDV
 y8wO32gzmcNK8CAR75imMqBlmfDafi1p6ub2LA3JuToBW9U8MIzF6Un/BcjbnGt3rgb458b7S
 EaOG6WKq5byfi14y9zqchC66gVV73cQrpfl2I9Z+tC5L2h8D3hHUGbxEdyP0=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b="d/fNYdsZ";       spf=pass
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

On 08.10.19 15:09, K. Kahurani wrote:
>
> On 22/09/2019 12:10, Jan Kiszka wrote:
>> On 20.09.19 18:16, Henning Schild wrote:
>>> Am Fri, 20 Sep 2019 16:59:14 +0200
>>> schrieb Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>:
>>>
>>>> On 9/20/19 4:56 PM, Ralf Ramsauer wrote:
>>>>> find_cell_cpu gets a cell as parameter, but ignores it. It only uses
>>>>> root_cell.
>>>>>
>>>>> This bug never had any consequences, as this routine is only one
>>>>> single caller, and always gets root_cell as parameter.
>>>>> Nevertheless, fix this by using the correct parameter.
>>>>>
>>>>> Signed-off-by: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>
>>>>> ---
>>>>> =C2=A0 driver/sysfs.c | 2 +-
>>>>> =C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/driver/sysfs.c b/driver/sysfs.c
>>>>> index a272ef4c..a15a2787 100644
>>>>> --- a/driver/sysfs.c
>>>>> +++ b/driver/sysfs.c
>>>>> @@ -353,7 +353,7 @@ static struct cell_cpu *find_cell_cpu(struct
>>>>> cell *cell, unsigned int cpu) {
>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct cell_cpu *cell_cpu;
>>>>>
>>>>> -=C2=A0=C2=A0=C2=A0 list_for_each_entry(cell_cpu, &root_cell->cell_cp=
us, entry)
>>>>> +=C2=A0=C2=A0=C2=A0 list_for_each_entry(cell_cpu, &cell->cell_cpus, e=
ntry)
>>>>
>>>> Found this by accident.
>>>>
>>>> Now the question is, should we fix it in this way, or should we
>>>> entirely remove the cell parameter, as this routine gets always
>>>> called with root_cell.
>>>
>>> Without having looked at the details, just one caller with one arg
>>> sounds like over-abtracted. If it was not factored out to make the code
>>> more readable and less indented ... i guess it should just move where
>>> it is needed.
>>>
>>
>> The reason for this help function is make the code more readable and
>> less deeply
>> indented.
>
> You might also want to talk of the huge design flaw where-by jailhouse
> ended up written in C :/
>

Given the critical use cases we are (also) aiming at, chances are still
higher to find economically certifiable tools for C than for, say, Rust.

But I would love to rewrite Jailhouse in something more fancy one day.
Maybe after retirement... ;)

Jan

>> We could hard-code the root_cell, but then we would also have to
>> rename the help. So for now I've applied the patch as-is.
>>
>> Thanks,
>> Jan
>>

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/e1bd27ee-8d2f-b25d-6553-6557f9bd3ba6%40web.de.
