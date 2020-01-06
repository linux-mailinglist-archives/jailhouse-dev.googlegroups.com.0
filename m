Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBBIWFZTYAKGQE3TBETLY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13f.google.com (mail-lf1-x13f.google.com [IPv6:2a00:1450:4864:20::13f])
	by mail.lfdr.de (Postfix) with ESMTPS id C80DB1311C3
	for <lists+jailhouse-dev@lfdr.de>; Mon,  6 Jan 2020 13:05:54 +0100 (CET)
Received: by mail-lf1-x13f.google.com with SMTP id d7sf7982251lfk.9
        for <lists+jailhouse-dev@lfdr.de>; Mon, 06 Jan 2020 04:05:54 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1578312354; cv=pass;
        d=google.com; s=arc-20160816;
        b=j9OM9PlAT/8YIRkrXic3NC9ACV38Q/jEVS0ErtbL43p4YZJrI/JhKwrmv5+8TUn89a
         N7Be8EJpFaBrjEPcWiWZiwYZgjno3trB5iFcz+pF/GW9IxC8fo0TUM13/WgFmvoosJGe
         cLyi3prO/7GQmSbn3bib9mXKKn5QLaxYfk9+aet93wv16AYQvQMaw+ruXzYO5i39ShhO
         lQLoajJ4L0PCov8wE1ththmuZx9+FYZCPFH+ILvJksm4Ra07N3gorDwuMni1UdfCPrZB
         ze29xFUx0Fn053kR5o5YaM4dVqEwbdi7Xf0W5DW+oBhoKpHdL8w1s5jROBPUz9pDiLRQ
         4JsQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=rpWpVvKoNEu/768dxGFzwHfu/8SyDHZ8b3lKe72y6dM=;
        b=E+piNG/0u+Ilsm96n0AZEEx7JZXnrWSoQHUy/BZ3l1wIoBzWqMySU5zcIgc0WTia5o
         jqbz2OXPPvoJBNPHtifyNKc0qzXGMIH9/5jzIQGq4QZBuG3zgpKfIEI2n6DxlUVwsw20
         hhfSWTQfhoIEc1SgG/8am0lV0Yl6WUdcFkjxig2SEQdbnWmisvJkWIYzEIKzs3Qg9mtU
         +mdH3yF/5CXOHke8OGoGTJ1RT12kxEUpBdWSp7g0rlDZbca+Q4bqlyT/eoeSYTZBG0FS
         XRCppd0foK5gZTNVbPXtojmZGT9Hbiq5G0GgnAGeqOlxR6uLVH3plYTGafkZ7NC7qlev
         lhTg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=RJzEEj9r;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rpWpVvKoNEu/768dxGFzwHfu/8SyDHZ8b3lKe72y6dM=;
        b=YBjhKHdnq8l8i9QnvsO/uM9R92zxymhe8irqfkM61iZj7Quvj4N+HhFPY6v/BwIhza
         bMDPseDIa//Rtcsl0Znjl+YKaMG8QSdcS0GrwDW++w0vT4hGZf8HagJNCj+hrCxDHTMH
         pfOGtBT/n31xDU8eg9jdBD6LsRtpHJMgye5nNjVym219Genty6x2VhUoTJwAFyI7EzZG
         Jvy1j6/3YwpA6YEFFhy3QloNsaXCdSmwnqrrdUcjRIFpu4Hezk2SSODADlXFXlHwEtZL
         19Enpj9/Eu90MVkUkVQ00l7j4fhEV8pmvmzQ8mAneZIX4Kd1+E7u4Ce8+Vll8BAfGqst
         hy5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=rpWpVvKoNEu/768dxGFzwHfu/8SyDHZ8b3lKe72y6dM=;
        b=smDPfygvt/eVAThLiWL9QYqmlmyN7UGvj0LN+DKYLBzNq29Fb1MucaEgkVmQ597oK3
         l1xhgnvIDxGQWv0PTPyguVpdFynLmT1eEE1A0a+2qKnhYZVJp36XUTtVh84P9Yz1ZKGV
         kNDt0xm54c2g01u2f0kVFUK1XAHam0TVB9ETSQcnbEXpSNRTW03xxkuT3boPtxT3RqN8
         /LtlrpDcSeafRvT4hYj90+mEhK0mv+kp9f0Yi6zk8rYb/er3mT0zjXxKjzOGim9SvgYx
         ng5qHyfuP7Ff2WhpPWEuzQm14+kdMkhqxI5JDaT5BvgQo2ZTaRa2hjphlPAeVJlz8Bk6
         vDew==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWMPGqJp5ts5hZgdxAVhr/6cTxy4Z43XtZQWsvLRFSk2bUrtJcX
	IftV2mLUYFHjVWv/RMf9quM=
X-Google-Smtp-Source: APXvYqx/cBamXw1UeqiJoZxy2NM+RTXiMoa/SB8XTgk058v29AgQTxRIKqTDutTNZziTBOjnfKrclA==
X-Received: by 2002:a19:c148:: with SMTP id r69mr2867017lff.142.1578312354224;
        Mon, 06 Jan 2020 04:05:54 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:554a:: with SMTP id l10ls4120868lfk.14.gmail; Mon, 06
 Jan 2020 04:05:53 -0800 (PST)
X-Received: by 2002:ac2:4add:: with SMTP id m29mr55331416lfp.190.1578312353488;
        Mon, 06 Jan 2020 04:05:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578312353; cv=none;
        d=google.com; s=arc-20160816;
        b=0AiNAj0ne3vETwmjnM2RUANQCIte/nCWG76lifmPJnl9D0lpmeuorxpJU4DNBP4/hR
         DwhsvNJWDBsdQRRXkSYpC17U0jMZkz2PkuR7Fzl4IEoSsOe+HBHj7VOBRVMM3QQTHEe7
         /uNBPyZS5aO0P+rODM5LVWiY6pILvEBI6PbvQdiGFvf9lDQXVjOBI9Fz3uFcoBoHDjUI
         4UeqjFPgJI9WDf/jDQBUdssVKDtxPwqIGY3nP66mSkiJPwFGICP4dW7KmKg0+KhADLGd
         dAaoWJgXMutVs/9TITvJ3x9M2JqR+rOW8Jxvh7ShC5R3pqJmWLU7Oe/QB3pnACIZIFdk
         xxSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=CSn4qr71JwRAohfwrWso1T46dXLqDgdViz/0AV+gkV8=;
        b=qOo69hJyhCho8wGWVE9T76LhMIr/9pVJsqeQxCK0af+NbS0sy++XOHbi2AHb6PwolZ
         /N0oFQZU6956SQ/w3vzlLGzP4qVRXimba6Jt7oaT0lViDTeRVUx+Enh/g/R6mtxT/wdk
         KmIcuWHqI1w5+c8h2Kg8Iqqg/7V8EVjmRWlPUpCmYkxzcy2kN+EQh5VqBnnkxdCbX0Z4
         X0R9a30jIscRk88nJzXon9syUJYgzO7fGgIVsGoTr0LsiRwANenTlJztCjEH/r4hoWmm
         w7xfUyM9oHyf3GL47O39jIDi/Jxw2b2hLyYzQmfa9Zm93ofKrleyxLZ00FekZYiHMAXU
         7p8A==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=RJzEEj9r;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) smtp.mailfrom=jan.kiszka@web.de
Received: from mout.web.de (mout.web.de. [212.227.17.12])
        by gmr-mx.google.com with ESMTPS id h8si2192282ljj.3.2020.01.06.04.05.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 06 Jan 2020 04:05:53 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 212.227.17.12 as permitted sender) client-ip=212.227.17.12;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.10] ([95.157.55.156]) by smtp.web.de (mrweb101
 [213.165.67.124]) with ESMTPSA (Nemesis) id 0Maamb-1j82Uj2sUz-00KC9v; Mon, 06
 Jan 2020 13:05:52 +0100
Subject: Re: [PATCH v1 1/4] arm64: ti-pvu: Add support for ti-pvu iommu unit
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20191230132406.19985-1-nikhil.nd@ti.com>
 <20191230132406.19985-2-nikhil.nd@ti.com>
 <ca2ab556-aa49-0525-29f1-67eff0d119a1@web.de>
 <22d04be0-c674-16a7-f36f-89f06419372c@ti.com>
 <7cc22bb1-4b6e-3e5c-2ed8-0fb78dc31af3@web.de>
 <dbfd8b59-103e-2dfd-03dc-6a35559da69f@ti.com>
 <3f332e7d-f2b7-91fd-375a-5dc019a94e7e@web.de>
 <f85ff658-0efc-0e15-1f7c-721cdfa3610a@ti.com>
From: Jan Kiszka <jan.kiszka@web.de>
Message-ID: <71a794aa-bb10-1cc7-fd5a-222be7be8530@web.de>
Date: Mon, 6 Jan 2020 13:05:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <f85ff658-0efc-0e15-1f7c-721cdfa3610a@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:MZF3OaY9IARlvicpaQElWdSdHbFbVTOVykL0zF/o/xjXXBnK9F+
 iqgeAJjmySE0rrqCxVvo0utBWyuIAY8TNeasKgUJu31Yny0ijjNkVJCQInya9//O0sOcH9C
 xwdRxeedm0lRhXJbS6x0fmB0UmSE6MIXAjDw8KkI43R9FPevbDPc/k5U5kHM6CKz372c97S
 yCNnTHb1zbLxqFp1nuOJQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HyQ5HARmR0c=:Av1jzq+5qwckVs6UbTWIPJ
 U+Xx8eM/X94S+REJb87YXjLTIA4325N2ALV2lFF+ISHmkqFUcMxtWfLkYxz2Z0O22rbr9XYaJ
 3CJAEDMvCiPMdZaGwxQuSp0JWRspmrl0kitlvSyh2hDLDqekYp34hmryd7XxzqttpltaDyBaL
 61cjBrWgpcGvKwD/VetcVc5fHZMLWSeeWfwJhIwpSRu4JnFsf/VcWMQqrPoHO4T1+fiW/VONn
 NHMyEkfkbrxkCGo7U6kFcH5aXJBe8r0HsotB68rfGobh1IxASoypFLgQDo67cUASkSsodvFrd
 cKCINdG8o9LhplJ0+pNmKED9zFhkU+4j2IVOj/xJ5RyqLTOkZ7J8lBkRDE5Y3SBSjZP1RpY7M
 fQqGehLMXs+VH++NU9bEyydleQinTqvNTKszxqArK+EvugzMck/3khZDmZlKMX3nLsN0oujhH
 m1IzXYjHEA+Oi4H7rGWVAFL+dcs9Tdg7jgBA73hJ5LKEfI3/6nVtUSvc9MwgSUdsBlsdgHHxS
 ZvWAEObxQVPN8QiO4EH+uw+dfKbNR/rbZL/1UEzYUNXQGRbXSOdavVTZK/0XejAT9VSJ7gbwK
 DxQo26S/jdmmGsYCTSIug2Lruq9VQYvu0TvoZnBQpISweZFS0vMMuwmo3W9W92b7kqdONqUvL
 gvKSAsyEPfHKdNO3FUzBluEya6/HrA9yLWM/EWwNnUZhtORrunroxx1wyaNDgaCDMSm+I4jDW
 KbYj16qq5f4jGnU00AcJiNnIaxUrP3SOVaszJK84MsUa2oG557RDaYOSHwikXP96fSVZKdLQX
 1ctt17u9PkKVWz92/xr2ooeVXZIkJIowEgo8oJwRlPMYhE9E4tpnZZsF0FbjjWpTK3Nt9/xAx
 yR3KZK0eoMN0bRqQ7aMYlWJ/eTgOh26h0brxBKauvr+3uhDA3F4lQYHeOpGcSmibx+lr1gz2L
 5aXfNs0Sbs9cJ71dWjkH8tHgI4Cilci1nFmZ4Xyjr8fO9JD0rmhbQ6aqbzoitBu8gnYu/Bcve
 SGG08Kop3a7MzisUBeZGUcoCOSlX2Bs28Fw9v4EML3S8cQb5jKvSChRVLMB73B0ENAfft3Lzr
 0h1N1k2f/7FaSpWFp6d+iIZR+JVZvwWGNwnCN+RzWDgWy1PDfiRUVVbCPOtMywKOrPx5zstgu
 q2wKZWNY/FwUEPXJUYmaib2nRmgobYhQPJxrWS5yhDU+juYKyRuSEu7M9I+0X+DTYNu8WDTaj
 lI5jD6h0fjr+HJyOGIXw2ELEkgOD2zy20odmbazXp6LaTmb+4RYgVHCTSM/c=
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=RJzEEj9r;       spf=pass
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

On 06.01.20 12:57, Nikhil Devshatwar wrote:
>
>
> On 06/01/20 4:14 pm, Jan Kiszka wrote:
>> On 06.01.20 11:10, Nikhil Devshatwar wrote:
>>>
>>>
>>> On 06/01/20 2:52 pm, Jan Kiszka wrote:
>>>> On 06.01.20 09:12, Nikhil Devshatwar wrote:
>>>>>>> +{
>>>>>>> +=C2=A0=C2=A0=C2=A0 /*
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * dummy unmap for now
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * PVU does not support dynamic unmap
>>>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0 * Works well for static partitioning
>>>>>>
>>>>>> Huh!? But this breaks cell create/destroy cycles, without any user
>>>>>> notice, no? And will root cell devices keep access to inmate memory
>>>>>> that
>>>>>> is carved out during cell creation?
>>>>>>
>>>>>> Is that a hardware limitation?
>>>>>>
>>>>>> Looks like a blocker...
>>>>> Yes, this is a hardware limitation. I it designed for static
>>>>> partitioning.
>>>>
>>>> IOW, we can also not change the configuration by destroying and
>>>> recreating non-root cells with different memory layouts?
>>>>
>>>
>>> For now, we have gic-demo, uart-demo and linux-demo
>>> You can interchangeably create/destroy cells in any order.
>>
>> I was rather referring to
>>
>> 1. create linux-demo with, say, 256 MB DMA-capable RAM
>> 2. destroy linux-demo
>> 3. edit config to use 128 MB only
>> 4. create linux-demo with reduced RAM
>>
>
> This should be fine I guess. cell_exit hook resets the PVU context for
> that stream_id (pvu_iommu_flush_context()
> subsequent cell_init programs everything as required.
>
> The limitation is on reprogramming while the context is already enabled.
> You can disable the context and reprogram a new memory map.
>
> Sorry for causing confusion.

OK, that sounds better.

>
>>>
>>>>> Although, I made sure to not break memory isolatio with the following
>>>>> workaround:
>>>>>
>>>>> When booting a root cell for Jailhouse, you would typically carveout
>>>>> memory for the
>>>>> inmate cell. I have defined the cell configs such that, in the root
>>>>> cell
>>>>> config, RAM region for inmate is
>>>>> NOT marked with MEM_DMA, this way it never gets mapped in PVU.
>>>>>
>>>>> When creating cell, root cell maps the inmate RAM loadable region,
>>>>> here
>>>>> that memory is not
>>>>> mapped in IO space.
>>>>> ---> Limitation of this is that you cannot DMA copy the images in the
>>>>> loadable sections,
>>>>> =C2=A0=C2=A0=C2=A0 which we are not doing anyways
>>>>>
>>>>> When destroying the cell, Jailhouse should map the memory back to the
>>>>> root cell.
>>>>> Here, again, the inmate RAM region gets ignored in IO mapping
>>>>> because of
>>>>> lacking flag MEM_DMA
>>>>>
>>>>> cell_create=C2=A0 and cell_destroy work in regression, tested success=
fully.
>>>>>
>>>>
>>>> Please add at least a test to the unmap function that warns when a
>>>> config is violating the hardware constraints. It's still not clear to
>>>> me, though, how well that goes with changing inmate cell configs.
>>>>
>>> Let me explain via the code
>>>
>>> root cell config for j721e-evm:
>>>
>>> 1=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - first bank*/ {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_st=
art =3D 0x80000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_st=
art =3D 0x80000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x80000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>> 2=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - second bank */ {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_st=
art =3D 0x880000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_st=
art =3D 0x880000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x1fa00000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>> 3=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for ivshmem an=
d baremetal apps */ {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_st=
art =3D 0x89fe00000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_st=
art =3D 0x89fe00000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x200000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>> 4=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM - reserved for inmate */ =
{
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_st=
art =3D 0x8a0000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_st=
art =3D 0x8a0000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x60000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_LOADABLE,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>
>>> Here, note that all of 1,2,34 gets mapped in CPU MMU, but only 1,2 gets
>>> mapped in PVU
>>>
>>> inmate cell config for j721e-evm-linux-demo:
>>>
>>> 5=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 /* RAM. */ {
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .phys_st=
art =3D 0x8a0000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .virt_st=
art =3D 0x8a0000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .size =
=3D 0x60000000,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 .flags =
=3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_EXECUTE | JAILHOUSE_MEM_DMA |
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 =C2=A0=
=C2=A0=C2=A0 JAILHOUSE_MEM_LOADABLE,
>>> =C2=A0=C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 },
>>>
>>>
>>> * When enabling jailhouse:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, all of the 1,2,3,4(same as 5) =
should be mapped in
>>> CPU MMU and PVU
>>> =C2=A0=C2=A0=C2=A0=C2=A0 With current config, only 1,2,3 is mapped. roo=
t cell kernel
>>> continues without any trouble
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Since the inmate memor=
y is reserved, no driver attempts DMA to
>>> that region, no faults seen
>>>
>>> * When creating inmate cell:
>>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, the IO mapping from PVU should=
 be removed from root
>>> cell stream ID and to be added in the inmate cell stream ID
>>> =C2=A0=C2=A0=C2=A0=C2=A0 With current config, unmap return 0 because no=
thing was ever mapped
>>>
>>> * When loading images (SET_LOADABLE):
>>> =C2=A0=C2=A0=C2=A0=C2=A0 In ideal world, loadable regions should be map=
ped in the PVU map
>>> for root cell streamID
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Since the MEM_DMA is missing, PVU unit skips t=
his chunk and never
>>> maps to root cell
>>> =C2=A0=C2=A0=C2=A0=C2=A0 If you DMA copy the images to the root cell vi=
ew of inmate loadable
>>> memory, there will be faults
>>> =C2=A0=C2=A0=C2=A0=C2=A0 We do not do this currently (I believe we CPU =
copy the images)
>>> Correct me if I am wrong here
>>>
>>> * When starting cell
>>> =C2=A0=C2=A0=C2=A0=C2=A0 Again, ideally the mapping should be removed f=
rom root cell and
>>> added to inmate cell
>>> =C2=A0=C2=A0=C2=A0=C2=A0 unmap returns 0 becasuse it was never mapped
>>> =C2=A0=C2=A0=C2=A0=C2=A0 pvu_iommu_program_entries called in inmate 2nd=
 time does nothing if
>>> the pvu_tlb_is_enabled returns true
>>>
>>> Nowhere, PVU unit reprograms the memory map to add or remove entires.
>>> Because it doesn't have to do.
>>
>> I'm asking for a check in pvu_iommu_unmap_memory that the passed memory
>> region does not have JAILHOUSE_MEM_DMA set. When that is the case,
>> something went wrong because the request cannot be fulfilled on the PVU.
>>
>> However, I'm afraid that test will trigger on non-root cell destruction
>> when that cell contained DMA-capable memory. That would mean any device
>> that this cell owned and that is DMA-capable could continue to write the
>> cell memory, possibly competing with the root cell loading new content
>> into it. This gets rather nasty because now you need to prevent such
>> writes be resetting all devices reliably. But Jailhouse can only do that
>> for PCI devices (removing the master bit), not for random platform
>> devices.
>>
> Sure, I will add the check, yes it will print while destroying inmate cel=
ls.
> However, as I said, the PVU context can be reset for that stream_id and
> It will cause faults for all DMA requests on that context. No corruption
> to root cell or broken isolation.

Is the context disabled prior to the unmap calls hitting the pvu? Then
the check could be skipped if !pvu_tlb_is_enabled, right?

Jan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/71a794aa-bb10-1cc7-fd5a-222be7be8530%40web.de.
