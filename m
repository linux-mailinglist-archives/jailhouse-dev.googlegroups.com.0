Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBMVFZD2AKGQETOMOBUQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13d.google.com (mail-lf1-x13d.google.com [IPv6:2a00:1450:4864:20::13d])
	by mail.lfdr.de (Postfix) with ESMTPS id E39BC1A5377
	for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 20:55:46 +0200 (CEST)
Received: by mail-lf1-x13d.google.com with SMTP id s1sf49286lfd.16
        for <lists+jailhouse-dev@lfdr.de>; Sat, 11 Apr 2020 11:55:46 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1586631346; cv=pass;
        d=google.com; s=arc-20160816;
        b=XYHDuuYAyqz+hiMvRI9tD/M4XWfhHu0H4zo1VleEzp9cBFdG0/VajDfZSHww0yW7ut
         DuwI9WIbnm5KHoLZCDc8nGYPbJh1QyRv0LPbiBTOynYlF6LEKhSVYS1fk9cykZ300sx1
         n7Td+sPvGaKgvuvmwoQD+8qNeMyKiMY+Ebo/GRHBAZrP1oKbBPVa+Rnq+PzVd4bUkCLT
         Tj23XcVDsgTfvbQNU/Di21y9sRpJhf9hGF33UaNIr6f/pWl/M1GYksprqfzQvOGWR0ws
         syvvikyF8rfvEy6NH0ZXO/fAsVcDBxx339knVvAOlXsSPDufctp9XImn3VItF0zKiwmK
         6ylg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=3I+zGhs+p5mJoxTXbvle6EBN03ZfFYKK6I1l8190PDc=;
        b=mtykiIq0X3MwTpODieFgtXK9W4XeNe3s5RDlwRc7aNJIKkHKFffhJ8JUIMX11w8A45
         /JT3oH9BG387ms1yiWUPIkiYnVTFkqdLcHmWF2arno/eMKNPyQ8C8jeszIiNMPSvcm0v
         YMLNbvtzfvH1tj9OjwbYp4SFl4gFgsoqkOnvvIsI3zRQOiSix2stiDmuYyqBimDdJhpV
         mkLuN5dpnQ+fbc28Be9/Rt25EViHwmfkh+KSbpe5E1bTLjkxrGSDfxqWSdvDssQcPKqc
         hdgwCX3XFBUJUI5sa+VdPRfxlkYcd12TUBEnmTW8pJZM4gwTAiigGQG+McbYwK/7l+Y8
         ZDFw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hQxKIgon;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3I+zGhs+p5mJoxTXbvle6EBN03ZfFYKK6I1l8190PDc=;
        b=EJ8oA5OJmhg1hxCIW4EoPpjaLZmvQGpTvzdh7WRlY5ggLCZeNEQcY1mTApxOK3F3PX
         waCKT3L554ziyAfdk3TvB0lbCgueuc9muiytEoYfpOiK1tb6kxchBAwBXcSMVj9R0B3D
         mmwBf0opWrBkaIsmMeyssA0SkujJbHrhGdWoTpyvWyTlHQUGK32atbQR9dbwSgkiAMQA
         2wdf5kZNzCZSWndwcnIL6juc4SkVLEzv06008U3D1HmFOCqMXre+gqFEjY7UU/M44wew
         YbCr/kDepaIN2s6du7uUpsuG1t7KbviaT25+1IfiTT/1RN7snQibd4BaEhQk9NFL3eKa
         C8Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=3I+zGhs+p5mJoxTXbvle6EBN03ZfFYKK6I1l8190PDc=;
        b=ZtWAfm+01ezFNZgbPvxn1UG16HK1YBHjr2rxBW5mevyJ6wfq1RMM/+l0gRXmw81uL5
         B7JKbYn8iRlMQ2wloCKYcKRfLQfDeT3xiHt0qpVV9YaeBaOGvu387GQ32gb+M7dc9Erc
         CQ+imiwRr8m9HKV6zPYkgtF8Buq4lQMWQrxcPNz6wWcXdeYdHlfgsVcrZJet6pda+GwW
         iWrUJkDhq75QftsAn2iSPopychYrJdHR/2CqMp6HVd7jN7hNMfQxx6IrANe8FmYzED0g
         yCKvSiJNXpzIbV5RmuXVmNh6mE7Ts4aIM1YnCdB1zadDTzkICRBGQeDoqqxmmVeFLnbj
         MQBg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PuZ6pbxIMhSCHAalDWutNkywENOSigE0k78eE2XinarqvsdBmi3f
	hnomCE+FEdwnD/p7eyWkm14=
X-Google-Smtp-Source: APiQypJfoV6nV+BSjut9TxzDeOgS0QCXgGMIwWAIIr+glGf9ZrSuj4dM6HTz+p+OpLkCNrsVWWfEDg==
X-Received: by 2002:a2e:878a:: with SMTP id n10mr6270005lji.130.1586631346497;
        Sat, 11 Apr 2020 11:55:46 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:984b:: with SMTP id e11ls2065629ljj.3.gmail; Sat, 11 Apr
 2020 11:55:45 -0700 (PDT)
X-Received: by 2002:a05:651c:39b:: with SMTP id e27mr2266910ljp.45.1586631345788;
        Sat, 11 Apr 2020 11:55:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1586631345; cv=none;
        d=google.com; s=arc-20160816;
        b=t6PNbS0MARCw1mZKa6rKICYbXICikBgmtbyzjLUlEGxLUBJeAy9YeSrJm5BwTNNoRc
         yTZ4jb0+Vh4z3p50EzuEgE1kbrnkp3MMJepIqVRahqUEKheGLDDDd5ikb+FkDjXjii1r
         7vVjxcNq//ZMKSGqm+aAQq2+nLPbCl0F9Egrrf778cc3hBu9KUcrVW/s+6/zK74Ax8/6
         NmNk17d5Id0bHdz4/G44pfe57RuWxi7dMcrM6OF+E8kBsu7Vcef0n2GglUwn5eqSShtN
         jbzvpmO2zKHoDw6YIP/NTm2180UV3DqC7gXgOH722XZUlCN2QAAhZLLCvKVsJnlNXRGi
         fJng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=a/izceH+nB2S96+MV/w2DS7LaIbM9euymNPrCIL4qKw=;
        b=AbNxxIEhQR/rpIX2q3LY7acMDOMZF+TwxQXB9T+8MiZtImX3M2W0xEnIncAiqaZrKE
         F5uFleTI/lY8/5tcqpQJi11ic+3R2DEUhBSCWPUtUIDGtyFUXR40L84aNUH6v3PmFjE7
         uwA/XbEenHLS/b7pCRucEzdFr1PQhDQDYXmH6JMJ7T/eoqnpYplnT7zdOhd8V80LCctt
         ppU2I0a/65x/oaqP70uktLT14lR+UM6pxvtoXf3DP2vF6Biyf/ev2aG0P4Hnlpp5aMZC
         A4+ooOm5KHNoH8vIo764cCZ62Wm0/afgtPe1/ol/ZPkoWDc7pIr8WJg7ofSDmSfXTcmF
         8n9w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=hQxKIgon;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.15.3])
        by gmr-mx.google.com with ESMTPS id m11si312461lfh.2.2020.04.11.11.55.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Apr 2020 11:55:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.15.3 as permitted sender) client-ip=212.227.15.3;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([109.41.193.243]) by smtp.web.de (mrweb002
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0LheZV-1isyTR48B7-00mu6X; Sat, 11
 Apr 2020 20:55:45 +0200
Subject: Re: [PATCH] arm64: ti-pvu: Panic on errors during config_commit
To: Nikhil Devshatwar <nikhil.nd@ti.com>,
 Jailhouse <jailhouse-dev@googlegroups.com>, Lokesh Vutla <lokeshvutla@ti.com>
References: <f87739b0-2990-1229-4cfc-105c36f4efa5@web.de>
 <9528c94f-c351-7ac4-889c-6d422be130ca@ti.com>
 <5badd0af-e586-fa58-f3f4-9aed052fd04d@web.de>
 <a826d22a-1c54-3962-b42a-085a8df872ea@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <c1c8004d-b46d-fb4a-b4d8-5556ee8b87c8@web.de>
Date: Sat, 11 Apr 2020 20:55:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <a826d22a-1c54-3962-b42a-085a8df872ea@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ROxLooBNWSuisA8HJuwb66K4O+E1PiO0sN4beIVqUv96ENv6jwL
 2EPDFkvB9FrNexJAGYbvEhubnC9kyIjjB9kwChQMtoPIliUvcgJJNIwY/qbP0RJHGELUEZM
 vBcIuMYUE/dhNR0Mhy+jSaRyTRu7Vb265KSNVr0BHOH48vt9s6vXqrGz3D6wuIKqLYIQM8Y
 K11zjJRoxKc7Od5Up8Iug==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:PRxQkiAUT24=:2+cE42GabDs/5T9I0R0Hqh
 QdkeDjIox0Flqyb3ORNC6915Ke6XL2tGO4fWybiRNtAksVZPtzhfIhatYC2SmVT5sgZ/AlaRg
 tmKMjUR6IF1TD5IoI73pFFMN7pTMOzNRQbFuWEssefJazzgi/lTaFeIZnwRVVxqYnlPI7I0Ja
 x/6O0TlUWyPeXcwmJSepTBBAIV2Y/AdSWa/PLyoxoe1XSrpZCiVJqem1h7IJjJ/bR9I9FZ0Yr
 tXYS0FdcO5aT+jSrAnfa3FVixr53e5wxcKMjGrkd2sOC8hsXSpnit1F536nVOFEBMN4GDUzYG
 jgHCmYT9qZEQcWRQxSfCiXh7RS2O3N39vQhIPRgmGVXuLnE/XnsBUYD9dj0SgRVPRB4i4d4yu
 4dD6f9g5Jd/iM0cYHNFyk1ea2LZ21RNrVWKKS1t2DipQS6Ey+MzFmpOmHTMRvkEfEnuATAVkm
 E93MqG9GkzKY23hT+RCEGfXrRb6+R4bkhSd79L96UjHQZ8Tq/5q+ktvsyW9D5YLEnv4itLqV8
 0WnRq4bPQI8LJO+zSJ/q54Xe5g21o5OXyXXZrN/0N5ZYeSs4dWrQk86tAmH8QHjDOCAmbZ2rh
 Cl08q/XIi4Rq4zQ9dmmZUUr79L1v8jxEBgQ6kNQq2VRz3QSzLKY4i91OTSU5xl2m53PkN3wmm
 BmMzHdg0rWXafCno50YH5KaTJDrfSBoZOMZV469HGsPlTOv0uGyXoAywYIu4KcxI3ldPkMTUK
 9ldR/GvRFW77lht0Ojey8CHz30M8HOarmBR/4aBNm4WePCkx7NL0nnpX7EYfKv99BLye0l8nJ
 G26rRoUCXdY3lMXVsKwNLtDvyj9ZmDaigVabAog6yLSKQjBfnmUefK7XGlye8UteRCPC+vSfI
 vv3Wv9gCHcA0H97E9uUih1XZT0Jz5jqGYytKGx5Gq9FWwyegY3vfSgN+pIQ7E9DB0sTtvSzAw
 dQM0n+AJp8BVIXB6h7KcG1MIsZmrMNeUE0bvNFCOmplaUn0kMcbXFeLzk7buXwnAuRnFsxv4M
 oymcA1lPeO8IcsQAGoEYoFXsIz9DBYutKZD2V6lIAah/vRK2WsHU3nqfTyb44FdZwSSu/iQPW
 NlTb7GuXa+XBhn9wcEUu/RIAnRc0jgkFrQjf/OxJpRBGrypHexL+IPZNoNFVp0jALIZw9ezdh
 XRJGG50nbSrf2WXCDMHh/m1TlGZ7K0h0l0fZF6+QXPGV/Bb2l1HhP5QsOKY/drZ1EKA87I3br
 O8NOCOQsQbuuw6SI/
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=hQxKIgon;       spf=pass
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

On 11.04.20 20:37, Nikhil Devshatwar wrote:
> Hi Jan,
>
> On 11/04/20 11:28 pm, Jan Kiszka wrote:
>> On 11.04.20 19:25, 'Nikhil Devshatwar' via Jailhouse wrote:
>>> Hi Jan,
>>>
>>> On 11/04/20 4:31 pm, Jan Kiszka wrote:
>>>> From: Jan Kiszka<jan.kiszka@siemens.com>
>>>>
>>>> So far, any error returned by a function called by
>>>> pvu_iommu_config_commit was ignored, only reported to the console. Tha=
t
>>>> would have resulted in an inconsistent configuration being run. Also,
>>>> pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors at all,
>>>> and
>>>> the former also returned an incorrect code then.
>>> This is because I have implemented all the functions with return codes.
>>> I have implemented the pvu_iommu_config_commit with int return type.
>>>
>>> =C2=A0From the design perspective, the pvu_xxx APIs are written from an=
y
>>> place.
>>
>> Nope, they aren't, I checked that.
>>
>>> It's the config_commit call which is nont returnable, So that function
>>> should panic.
>>>
>>> So, the only place for panic should be either in the
>>> pvu_iommu_config_commit
>>> Or, in the iommu_config_commit
>>>
>>> Regards,
>>> Nikhil D
>>>> We rather need to panic-stop the system in case some configuration bit
>>>> cannot be programmed because there is no way to roll back from a
>>>> config_commit by design.
>>>>
>>>> Signed-off-by: Jan Kiszka<jan.kiszka@siemens.com>
>>>> ---
>>>>
>>>> I wonder if there isn't a way - provided it's not too complex - to
>>>> build
>>>> up the programming during cell_init/exit, validate it at that chance,
>>>> cache it, and only apply that state on config_commit. Would mean less
>>>> panic.
>>> I gave some thought to create the data structures before config_commit.
>>> But as of now, there is no way that exist.
>>> Following is the sequence of calls
>>>
>>> pvu_iommu_map_memory
>>> pvu_iommu_map_memory
>>> ..
>>> pvu_iommu_map_memory
>>> pvu_iommu_config_commit
>>>
>>> There is nothing that gets called from framework, and there is no way t=
o
>>> figure out if the pvu_iommu_map_memory is the last call
>>
>> OK, so none of the error conditions can be predicted from the given
>> config and current configuration due to the unknown upcoming mappings? I
>> don't thinks so. E.g. the alignment checks in pvu_entry_write(). The
>> entries checked here come from a a cache, and that is built in
>> pvu_iommu_map_memory where we are able to return a proper error.
>>
> All the alignment check errors are defensive programming only.
> So it can be guaranteed that these functions will succeed when called
> from the
> config_commit, except the alloc_tlb failure.
>
> I can maintain a free_entries count per device and check if the entry cou=
nt
> exceeds that. Assuming that the last memory_map and config_commit for a
> cell happen
> in order before any other cell's map_memory is called.
>
> This way, we can track the errors and fail the cell creation.

That sounds good.

> I would still recommend a return value check and panic to track bugs in
> the entry creation logic.

If there is a real risk that invalid configs we can't catch earlier or
unexpected hardware state can get us there, yes. For all other cases, I
would rather recommend to sit down, check the code more than once again
and exclude programming errors upfront.

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/c1c8004d-b46d-fb4a-b4d8-5556ee8b87c8%40web.de.
