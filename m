Return-Path: <jailhouse-dev+bncBC33JYE2XMMRB64EYPUAKGQEVZXKAVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-vk1-xa3d.google.com (mail-vk1-xa3d.google.com [IPv6:2607:f8b0:4864:20::a3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE350AB3
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 14:30:53 +0200 (CEST)
Received: by mail-vk1-xa3d.google.com with SMTP id 184sf6313450vku.17
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 05:30:53 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561379452; cv=pass;
        d=google.com; s=arc-20160816;
        b=EWWtmszAt3Zb2JPQZiL6YMGVRfyHNo33FIhpv+/2gugcVKhv0hHi04Gmuco7SxD4LS
         hQOSzycblHARD600BCgzWNHAkucyc1Nj6v/tfKqCx72aTWamwojiIgrZ0LsYAcAhoxJp
         iXr/3M3DykVlJ5LGsJXWAySWuoi3+ffzJgweHnC6L5vD2wZO2gHUql0jYPoNYvSMgImK
         uZoep6evSjk6ya7QxBgzCe0JSNGbsHxQxRQl3DKzywHwiocr8TPrUWfJswz+5PiyQNVl
         ZhgZLx7FODqc86IWLs9ZopvKobg4G6HxuctrZRfIYvs6B56Dbuk6pQThT5Qa9/+EDbfz
         KFLQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=QczhyT0LnKwsjl4RoAZmxh/Q+9kvSoEmTdouvJ5XtA0=;
        b=q6uhRASchc+t+ue54xiPrzRyOY2syKJJPo6B5NgT4vP1Giv906qEtZ4VzgGg8t35Sl
         qRmtC2YZPmWjDCRjSGjDi2UPOVypXVmC40vBTky31D2AoQXv1NnNSkH5NG9J9AanRLWR
         rErDnLiwBXFlAmZExUqH3WCgLSE3Yg7y868RO8Si2pBhAySsbl4tUx0xbZ3Ig0xwT+ke
         VAi/RIaJuuZTQMspmokQIpzIKRWPMdgutE2dsYs3lFc8nWhIcgFytxLDUW7UbYH3AMTL
         sX4GPqL4hWDWE910QYCuqNo73SJOWnrSJyVteQinSw2IKJZTL85++ng7ExOKK/hnQDgw
         B3TA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EyVFeeXC;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QczhyT0LnKwsjl4RoAZmxh/Q+9kvSoEmTdouvJ5XtA0=;
        b=N7NcHQc3Lymzn+WIbVt8knhdyhBUbR7m4JQUQVAyDrn+m6vR0oF8dyA33xUoF/5trf
         NpP515CV1dIdnuwedBlFtGmIOQCJZ2oYUgiNDZkbnhQ3XRA2gc3dT+R+xs60BzFgNOxM
         ktYya9oetNdAkzYI+ZpDUpP8hoNXyzuhFYOIdrPFKIcYZ6mkjmxKPfcyIIRVHygOUXrB
         o3PcTtzaNkc3hIw014+lojyRMyUAZ3EYo3m7vxkvT5USmto/pcjjlG/Mwrm276jzzDw1
         lfVQPiZyQ3rD9Xt+/wsYu+tv0uSbglLrpftK66mADFO2ym41fqySkWT7hT9Zh/mXbX1f
         D1fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=QczhyT0LnKwsjl4RoAZmxh/Q+9kvSoEmTdouvJ5XtA0=;
        b=kI2REhJANksYB20QgzWMgf/AF+NvK580acCHJRVZvPBoqaVCxK0fAga0YYmZ8x6Ufo
         Afdegrjk6jWm7KAeYCudPPe9fIzi6FIzIyWblSvgATdRBA9+Ut64o3ikE+gLFxibm5tL
         HrlpCniTUaPEPYhAk6sK+xpZ4FQIYZVDof8TKAdK+KrF72Il2Rhb8CD97vXWwxNW3cPk
         wQoo77Mtd7zCR8vsKG6c4D9eWDKHmKSx8YCjm7O5yx+grfQ+rHCwUxw3ztwMVh+Fr5LF
         jTEEe4L33pl0N9LAdhTmjtnIan8l5ZJUJZwE4oY2NGegio+p2eKhDhgLgsUzOwDVo/cq
         2uQA==
X-Gm-Message-State: APjAAAWRJUYQLKbcVacvC4EM+tps/1e0EIt31Lci9sKpQTpBgP6FDSMK
	8N1c7fzSn66uEY1lkDqF8hc=
X-Google-Smtp-Source: APXvYqwnoPSTwst19cqAeQFdhrIupL7P8PQgvuBWVYRB2q08J9yCUz0G0p9TJ5k/dMDXBZGlKuv1Ww==
X-Received: by 2002:ab0:138e:: with SMTP id m14mr878558uae.71.1561379452012;
        Mon, 24 Jun 2019 05:30:52 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a67:6844:: with SMTP id d65ls1643778vsc.9.gmail; Mon, 24 Jun
 2019 05:30:51 -0700 (PDT)
X-Received: by 2002:a67:330e:: with SMTP id z14mr17809809vsz.68.1561379451566;
        Mon, 24 Jun 2019 05:30:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561379451; cv=none;
        d=google.com; s=arc-20160816;
        b=Ws9pbQjvK/eKVXUvhyIClij5ZqU3PBg1wgf0H0vJYpK74yIRcj16D9ITBw+knDRhhX
         ziELIkSGz9POantdAbWOJSrQkUxywJZwMoN4zLAgs7uHeVsRl1tnY1Hcs+35ehfLDzWw
         BeS8m08pcccECiRa6oiPx3LsX7SdIEkeY2DYTyU6yzXqblOBsjgtGSkiTb3SciAPNLbH
         p1jeLC4sVmElx9kPb/YJUteM+TxTrMB+ECpmqyvKtmnz3XcTWK1rYWBCTzyaPZXToI6+
         c0QKj2PwGeeIvf1JlrCdj2vJPsIukr/wWcWZBUUwMndayVV8+D/QztKW4GKwChsB1UWv
         9p4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :dkim-signature;
        bh=BIJ1cKrfKdwk/fqNp2eHkoOSCYsjgfN0Xfne1s70UZM=;
        b=lN1qaoisZ4dhllHFEyaZceJDrn/ZqWVFENhXNO1Wc86p4YcEkKOuHp7ua2dpCVWPBu
         OSNnzCSOCVWfTA05qP65OylLWO8wK4zYDlHD41HflqB2sPVdmXflBPjyKZtavE+LtGQ+
         PCLdyL1TkVRD9fomQWJTLZtFRikJ5sp8PXwYhWRebZFRxgzjUyDIJUxZXzFr7SXcuxk+
         4ZpK1uW63h3xbKKpWw24RE17UZKiAZTvYyzpYa4guDNwVD2DnzYtGBhRpL3mrMdFSU2a
         oHQ48cW0gokWEHgd2dVM4ILGIb/1l77v8yCv2/xWKsj4iiRetSMQGg/fnRon5MK8zR9J
         bqIQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=EyVFeeXC;
       spf=pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) smtp.mailfrom=vitalya@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com. [198.47.23.249])
        by gmr-mx.google.com with ESMTPS id 63si823523vkn.0.2019.06.24.05.30.51
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 05:30:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted sender) client-ip=198.47.23.249;
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5OCUmlQ002521;
	Mon, 24 Jun 2019 07:30:48 -0500
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5OCUm88074967
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 24 Jun 2019 07:30:48 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 24
 Jun 2019 07:30:47 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 24 Jun 2019 07:30:48 -0500
Received: from [158.218.117.99] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5OCUlTw044310;
	Mon, 24 Jun 2019 07:30:47 -0500
Subject: Re: [EXTERNAL] Re: porting am57xx jailhouse support to v0.10 version
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>, <jan.kiszka@web.de>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <2f1c216b-71a5-5a78-79f5-416b11539d81@ti.com>
 <ace421df-a519-4509-2b97-6713009b85b9@oth-regensburg.de>
 <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
From: "'Vitaly Andrianov' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <eae01b0c-3e7b-04ac-4ae0-24c407e85bd1@ti.com>
Date: Mon, 24 Jun 2019 08:27:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <27491b3c-0b03-0ba4-da94-6a8cadb28006@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: vitalya@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=EyVFeeXC;       spf=pass
 (google.com: domain of vitalya@ti.com designates 198.47.23.249 as permitted
 sender) smtp.mailfrom=vitalya@ti.com;       dmarc=pass (p=QUARANTINE sp=NONE
 dis=NONE) header.from=ti.com
X-Original-From: Vitaly Andrianov <vitalya@ti.com>
Reply-To: Vitaly Andrianov <vitalya@ti.com>
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

Hi Jan, Ralf,

On 06/12/2019 03:27 PM, 'Vitaly Andrianov' via Jailhouse wrote:
> Hi Ralf,
> Thanks you for the quick response.
>=20

[skip]

>>>
>>> so, I have to implement the corresponding am57xx_init() and
>>> am57xx_cell_exit().
>>>
>>> Here is the old mach_cell_exit function, but many of the functions it
>>> uses disappeared in the v0.10 version.
>>>
>>> void mach_cell_exit(struct cell *cell)
>>> {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 unsigned int cpu;
>>>
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_cpu(cpu, cell->cpu_=
set) {
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_entry =3D
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 mmio_=
read32(wkupgen_base + OMAP_AUX_CORE_BOOT_0 +
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu * 4)=
;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 per_cpu(cpu)->cpu_on_context =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 arch_suspend_cpu(cpu);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 arch_reset_cpu(cpu);
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>> }
>>>

I have implemented the am57xx unit. At the am57xx_cell_exit() I set cpu_on_=
entry to=20
omap5_secondary_hyp_startup() - physical address. That was in the working v=
0.8 mach_cell_exit().
But I'm not sure what shall I do with the remaining 3 calls:

                  per_cpu(cpu)->cpu_on_context =3D 0;
                  arch_suspend_cpu(cpu);
                  arch_reset_cpu(cpu);

When I execute "jailhouse cell destroy 1" the kernel cannot bring cpu1 onli=
ne and it still in the=20
hypervisor's WFI loop.

Any advise?

Thanks,
-Vitaly


[skip]


>=20
> In v0.10 there is no arch_suspend_cpu(). Does my am57xx_cell_exit() need =
to call some equivalent of=20
> that function @v0.10? If yes, than what is it?
>=20
> Thanks,
> -Vitaly
>=20
>>
>> =C2=A0=C2=A0 Ralf
>>
>>>
>>> Thanks,
>>> -Vitaly
>>>
>>>
>>
>=20

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/eae01b0c-3e7b-04ac-4ae0-24c407e85bd1%40ti.com.
For more options, visit https://groups.google.com/d/optout.
