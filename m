Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBFWI4T2QKGQE6JYZZTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wm1-x340.google.com (mail-wm1-x340.google.com [IPv6:2a00:1450:4864:20::340])
	by mail.lfdr.de (Postfix) with ESMTPS id 775541CD5E4
	for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 12:08:23 +0200 (CEST)
Received: by mail-wm1-x340.google.com with SMTP id g10sf1139810wme.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 11 May 2020 03:08:23 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1589191703; cv=pass;
        d=google.com; s=arc-20160816;
        b=rFO/xLJ4xQww8G30D72Irh+B3mhm1/eiTVGu4zCyrvZ3zAwISwlICn6wOailistryq
         Cb7dMNtzxwb3XOUuKc0IlyWBTxPiD1iA0nqInxp8whu5jX3X6Yleo/vVK3iJ+REVczbq
         F/IXViIJj9Pl5vWoIjLfd1FJUNxUy/EC4MzqbF6B4L082rPMtk62kYKkM7Zh2Zb0OHhH
         crmv+X60omKvcg9h7mZDCD9EccCsOUoU0UIGfSPlnlXqyi5yI55f06UvsYNhg2H1TDNA
         xC8Oq0lxyYe3/OSyfZygx/cRPCbDP1ruNv0VBO5DITKlVJztj2vvvIf75JN8acaeSbRy
         nfmw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=aEE/t/9pCPSJsVI7CVI0/rNN8tMAT5WIWxsy/bGXraE=;
        b=CXGQK75LuW1cJTbbkoB0QbiNtjfnPUqqB65H1MJgGKhUm/pz+frLHwX2jmZL44euH+
         cBrx1QfR9jXW9DWMvdH2aOImLJd9NHcUwTWCSVN5OgeReql7Ub64a8LLGfVzAIdwGdiG
         xmGtOOwyNyIIJVyL0UkMmEBcCaTT0Ry7ukZOADVQb90ncKoDsB0uDummnRkgKgtnnMND
         YJ9xlK24DalvZsZco+31llEY+IX2Dhv1357y1UWS/8ZGYASsZ3gjc01Y/dbY6gobmEhq
         9nnxplNcuLmovnlmmZtLoekCKawPV32M5Q2Sr+9t5kN7dCrs2LoiwSDYjB0GG5fKNc7D
         BQdA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aEE/t/9pCPSJsVI7CVI0/rNN8tMAT5WIWxsy/bGXraE=;
        b=inH61EBbd0R5eX0LIgKSjAb3t/CVgdkmy43I0g89hUJ7gITsiz90QhNr1dlyHqm4Mk
         LiFIhlUCGEN37cDwzKtqVYXWQh5rbLi87Rakrfxh7YDuWAGPSIUxKdkUhyoNXInPeFfq
         AUYPOiMkaWCI2qUpnOuh1cNFLqpiJ4M8tsimcfdH6ZAAkSFKO6djUoWq3Wr5UJ9xQhxS
         D2m1qy0jfvSp1uaE+5G44amhZGe/w6paFDLXECw6f5ASrpj3ZzEkEvOi9G3Vgvm/22CD
         5KKfrQD3u9Lh2IjRvX4ozFD5+x/NTvJncvqifEob7Kzqil50Isb4g+l3VU8BK9kdz34O
         eZrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=aEE/t/9pCPSJsVI7CVI0/rNN8tMAT5WIWxsy/bGXraE=;
        b=QXLX9t7n9d9C5oYXzcdLRpTJq9JTPIGkCpuaOZ5uV37C3iJZOr4j3jD7UpHsxNqAW8
         AsMR0R5zffSbrgzvbPD6vN7NtDB6Qear99WBW/By5CfmzSZLCgvWP3ZkpJUHp3MyZpQm
         Dk9u+Xd7rgK9kn8QLHCoDBTdg23hyLtLTX38yg6Zxn2+MCmdYFc16zNg3sAjoabgI1yG
         xKXlXwKDA7hzb02pxi6VEs5WKf4yvYanr9kqP8RkZmR7d0I2ZbVe5lutq2a5QeU08fy+
         67o70PCAz/sdUGCV5MEOof7ZZ9oNAZmD9/jwaLnwsEwTivAHCid6FlocjtDTYmDMZdZt
         G2tw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0Pua+RxdLP7xXZ0jSxXM2CKNKgOZsnbZIRPPwNKcuunqMOrWb+qb0
	yv2KklDSZMKudAvrqzJIHx8=
X-Google-Smtp-Source: APiQypJ/iU3Q+qMM+rR73a7ikbkJPVL/Sv+Xrla5Xnz1i6YXlvxwXqQarusve4G2MGtt9MBCLojxVQ==
X-Received: by 2002:a5d:448e:: with SMTP id j14mr6231846wrq.261.1589191703165;
        Mon, 11 May 2020 03:08:23 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:adf:a502:: with SMTP id i2ls2662253wrb.11.gmail; Mon, 11 May
 2020 03:08:22 -0700 (PDT)
X-Received: by 2002:a5d:4e8f:: with SMTP id e15mr17973740wru.91.1589191702408;
        Mon, 11 May 2020 03:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1589191702; cv=none;
        d=google.com; s=arc-20160816;
        b=mcJE9V0K24/SM4LQelI1DHHxFB6krwSJqyBBjymqktEVWs4i+DJBbArxd4iMgmHdYT
         zXUedql9uV7N48tXCeXSVmydnJfoymbZ/nBGuWQkp51Nki3pPABKD61PbWsabcUhi6kO
         D5g6kGw+UEze0uvjBx5u7isDEoGHUoRXNaWuHk++8iBOtVdnSXuTC/tnSsuttalgYG8d
         48JZZVq7/QGePrl5N1yZafBTEBfDF3VQEMmPWLyNHFuw1dn5AlDNyjHymOJXAqCQ2AGW
         OZkZVDOLO3Jz4AYcySkq0RsFmcpFffCHg7F+esuG1r/C5k1DcDMyPTTuiKGmQwgcI8rP
         ISmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=JIvWZ+84sIO/lw5+CWl2Eysy7gX6YVfJxQWgleUTGjk=;
        b=ZdXHWSqkb9B1iESV4hYbvdQT/fz6tBVVXz4Xj5b+3w25Y/5uK0KNUnA3tZrHB8qSpo
         qYTW5zYZ8g/5URyedVoUIKicAlgKAoqbiroCWMC6KWBTAu3V59YNfu0WF43jtOXlPp38
         uSFgefYRC5+gPpTL0SzabKNVirdjJVZMHf/JjAndSIYtOdaEM2qYpZ9TNGhqk/IlsWte
         RmjBb5HfC8Iu+M4tjfJpX5dnL5EoCPDHlIrrL6ObvzHk+QsJ3GPzxlBN+wbVubt0clMr
         JleqlRlDVtZzpMLtLzl3G+U5Wr0lOQ/ok+zsqzEda7Xsy6EdzC1E9ttXWEsTZitR73z/
         T/bg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id v11si150095wrp.5.2020.05.11.03.08.22
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 May 2020 03:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id 04BA8Kov024586
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 11 May 2020 12:08:20 +0200
Received: from [167.87.5.144] ([167.87.5.144])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04BA8KtC013199;
	Mon, 11 May 2020 12:08:20 +0200
Subject: Re: [PATCH v2 3/9] driver: introduce col_load_address for colored
 binaries loading
To: Luca Miccio <lucmiccio@gmail.com>, Marco Solieri <ms@xt3.it>,
        jailhouse-dev@googlegroups.com
Cc: Angelo Ruocco <angelo.ruocco.90@gmail.com>
References: <20190327121849.1882-1-ms@xt3.it>
 <20200421100351.292395-1-ms@xt3.it> <20200421100351.292395-4-ms@xt3.it>
 <c0710d88-a53b-c17e-8c1d-6615b9b8bf09@siemens.com>
 <0af1c1c8-52ee-f822-66e5-c7926fac8596@gmail.com>
 <b58259a7-4aa0-7182-1ba9-b762be5cb82d@siemens.com>
 <b4c2716d-c5b3-b08d-6c2b-ebb7326102a9@gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <942fdfa6-5be7-e17e-d447-d1c2f41da80f@siemens.com>
Date: Mon, 11 May 2020 12:08:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <b4c2716d-c5b3-b08d-6c2b-ebb7326102a9@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 11.05.20 11:07, Luca Miccio wrote:
>=20
>=20
> On 5/6/20 6:54 PM, Jan Kiszka wrote:
>> On 06.05.20 18:42, Luca Miccio wrote:
>>>
>>>
>>> On 5/4/20 8:33 PM, Jan Kiszka wrote:
>>>> On 21.04.20 12:03, 'Marco Solieri' via Jailhouse wrote:
>>>>> From: Luca Miccio <lucmiccio@gmail.com>
>>>>>
>>>>> Currently Jailhouse loads inmate's binaries by mapping its memory
>>>>> region
>>>>> to the root cell. When coloring is enabled this operation becomes
>>>>> not trivial. To avoid logic duplication in the driver module,
>>>>> use a special memory space when loading to colored regions. This
>>>>> convenient memory space starts from a fixed address defined by
>>>>> `col_loads_address` and will be mapped by the hypervisor using the sa=
me
>>>>> size and coloring configuration as the inmate.
>>>>> Since there could be platforms with different memory space layouts, t=
he
>>>>> choice of `col_loads_address` has to be done accordingly.
>>>>> Allow the user to set this value in the root-cell configuration and s=
et
>>>>> the default to 16 GiB. The latter has been empirically choosen as
>>>>> default
>>>>> value.
>>>>
>>>> This is better than the hypercall in v1, but I still dislike the
>>>> approach for the complexity growth in the hypervisor.
>>>>
>>>> I see the point that some logic - namely the strip width calculation -
>>>> would have to be duplicated into the Linux driver, but it feels to me
>>>> that this would be a better alternative overall. Did you think through
>>>> or even try such an approach at all?
>>>>
>>>
>>> Yes. Actually it was our first implementation, the v0 one. Our concern
>>> was (and still is) the duplication of coloring logic between hypervisor
>>> and Linux driver. We put so much time into this problem and we came up
>>> with this solution and we think it seems to be overall the best one. I
>>> also understand and I agree that this solution adds some complexity to
>>> the hypervisor but even if we move some logic to Linux, a part of the
>>> complexity will remain in the hypervisor.
>>> Moreover, moving coloring logic to the driver opens up the problem on
>>> how to copy in "strided" mode based on the coloring configuration. We
>>> did it by copying one page at a time, using the next_colored in the
>>> driver module (duplicating the code) but this approach was too expensiv=
e
>>> when loading larger images (e.g, Linux inmate).
>>> One solution that I see is the following:
>>> - during cell load, Jailhouse remaps the inmate memory to root cell as
>>> usual but in colored mode
>>> - the "special" memory region mentioned in the commit is created by
>>> Linux instead of Jailhouse
>>> - the copy is performed virtually sequential
>>>
>>> The idea here is to exploit the jailhouse_ioremap function in the drive=
r
>>> module.
>>>
>>> With this solution the only complexity that remains in the hypervisor i=
s
>>> the memory management for the root cell that is introduced in patch 5
>>> without the "special" region part.
>>
>> I haven't fully thought this through, but I wonder if storing
>>
>>  =C2=A0- maximum number of colors
>>  =C2=A0- color stride width
>>
>> instead of llc way size in the platform data and using that also in the
>> driver would obsolete a lot of logic in the driver and the hypervisor.
>> Granted, that would push some of it to an offline calculation. That that
>> would be a typical Jailhouse pattern.
>>
>=20
> I see the point but who will provide this values in the platform data?
> Are they calculated or?

Yes, they would have to be pre-calculated. For convenience, we could=20
discuss to do that in the kernel driver if those values are unset and=20
coloring is requested.

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
jailhouse-dev/942fdfa6-5be7-e17e-d447-d1c2f41da80f%40siemens.com.
