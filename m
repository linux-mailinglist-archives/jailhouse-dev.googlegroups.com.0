Return-Path: <jailhouse-dev+bncBAABBIHOWOFQMGQE23WF5PI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf39.google.com (mail-qv1-xf39.google.com [IPv6:2607:f8b0:4864:20::f39])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9DB430EB5
	for <lists+jailhouse-dev@lfdr.de>; Mon, 18 Oct 2021 06:25:06 +0200 (CEST)
Received: by mail-qv1-xf39.google.com with SMTP id gs5-20020a056214226500b00382f5609124sf13838519qvb.8
        for <lists+jailhouse-dev@lfdr.de>; Sun, 17 Oct 2021 21:25:05 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1634531105; cv=pass;
        d=google.com; s=arc-20160816;
        b=B+woRHPizGHEfFyXuCLbBB5/GkJ+2CrkqCBt8f1AdVXDOv5gJ2fH3IH0hjGW4AHmKX
         ye3QtaQ9yx/+pKoV+EG2udC7HLHBRe/zNAZ2EfYAEoM1Wc+7jhXXeJ7sZnf0X9xKnI5r
         ER8ghClOm0h79aOWJkwxx1p2XemUGtZGi4OI5lCyF5P13+dJMA5Opr0PjDMuzXSGWZpM
         9JDToFhhn2Ofrb1Fgi02qYGv4wpysS8SRSziypVlA6fV4h6Id11g1Lyp6BxqjiI2QvpX
         IGm1nwNq+d0ChfUiCuCXkgNr2Ef5P9CQGdC5EP2ePOvnjjHdKvFQjs+cTWRGgtyStAkL
         QB1g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=qj7L96M4fAPpcVnj9h31Osqx4Zz54r/dnQtH5uBmOKM=;
        b=I82VJmGTN0m3URAc4/nZUeJNQOE0azH6PHgheQbdAJQ5Aiverc5/XKjKF8TX4s5jHG
         9rU4zl7uqTRmqsLZ3kaV4Qmyn6y9mlPYFwJaVJcbvBzhucQB2Xb5Vjdap69XuAeFUKJF
         ZOMFOGzx/BtzVozzrX4aSRoZPwssHHl3o+kD/hVRbCaINvu0aGugKdSzlcfTdYbOKlTi
         QZ59MuXUkvHuXC+Cv598uZYsuZHMt+hRGknwY+JProftX4RD3KxCEgrBISr5cKi4sRpw
         R4y5TLjtMJqHy1Jam5bd7V4Jw1rCwUQPBcYH3k62pnE1mXJXHc5GMFkhlSKMe+WkWtxu
         YtPw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=zhengchuan@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qj7L96M4fAPpcVnj9h31Osqx4Zz54r/dnQtH5uBmOKM=;
        b=UQYpnIx7bC+Mp/L3vIXfxcIqeoqIkBOLAv1Tx03FRlQT8j2DwVKZyRJqkyFrVPQ8CZ
         zLEGxtcdlpWxumYZjamx3HVLlogpcF+Y0moQfIKXFaZ2pQ2tA33uehSN+30T1cqjRJR4
         7yjwz2vvSg6gKWBOjqUg490AmXseBXF/vTsqZAyqM4fE3jFOYz2mRPwdrbGka9v5bc+t
         KLoRgzDr/Nqbb1Cc3jaLkyOWZYEIhR/WGoHLV1jLgjcAAnBY98ilFTIzfeWbRNrXT2Dt
         vN/HClRwLyekYNFbeBvN9HEZ/j/ZXtb4eTxyoomlAFkR6m/i8PjVGgvS0C1/ZFq6dAq4
         vmwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=qj7L96M4fAPpcVnj9h31Osqx4Zz54r/dnQtH5uBmOKM=;
        b=udu/hXKUxi5dL6fG9vgt3Jt/+gvTjRGeIMXoiweOc9AZW/MtjmV5wOsARXIR4d3AyQ
         vza32/gsrNkohT2kWQYkvOtDEmZg3iDVh5NQs06Y3iSoIQh57GKBBQuG/B2WuQC0HQqy
         U3DYhwZZZhwnxayA9PufbJ5XxYwPR50Xwrgt8xs7uEdtSOlsz5z3L0aHS07ZJ1XcVsCl
         Z6Jc2CoGZFdDL8pXGXhatICXd0JqziUgO+5fJC/Y2BcXoqZR/JXWyGc8KcRbES/GRx4F
         fKER2wbtuu3GOPpkG5ApIhc5p8RBeOdskDL5lMWYGq7CKKrgE5qkwLP4q3LU1+iBlg2c
         dfVw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531KtEcsia/lLruba78Ti6i2ttmPv0m5mp55ThoB9+g8myQBx/Yn
	MrzOa8IXU7Etm7KPXhSvTl0=
X-Google-Smtp-Source: ABdhPJwtNrTPEOp6MCBdLv7QVCie/u2zI6lbVNhL2eK3DDmNzdsqZWEeqVQtW7eGmkjFCOoGtRpfSA==
X-Received: by 2002:ac8:5f4f:: with SMTP id y15mr28300336qta.19.1634531104965;
        Sun, 17 Oct 2021 21:25:04 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5a0f:: with SMTP id n15ls1772081qta.1.gmail; Sun, 17 Oct
 2021 21:25:04 -0700 (PDT)
X-Received: by 2002:a05:622a:1492:: with SMTP id t18mr28491432qtx.229.1634531104458;
        Sun, 17 Oct 2021 21:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634531104; cv=none;
        d=google.com; s=arc-20160816;
        b=jN0GAOMAuPpshWl+oFkMNFIAjQvD4COVq6o3Dyh+YcDqfsGevMp0nsRG8hizX+SS1A
         T3qrbOtm7Z0Oc0kdLfvWwUoAbQOFnAJUtY3cqZzJsWUPyM3bVusA/ThwqS1P3RladtdO
         We+2M4dPw+79nsyVkd5J3sGT1uXMNhcbnu0D+wVXvDdt4nGe97C8LiZHKcBp6c8uaHzk
         SlEVKl6M+Z3qArXI4B8Mf1rPVcm6hrMZ4J/Kl18g3bPCqYdZ3udG3relazgT/gbXrRn1
         wjkBHL4L8vZNb5vlIwFM09SDY/Y+zDqWkhzGbiNhFmHstr1jiJEaOVo19e5CAkdB1w1L
         F6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=k6Oy/hsJupu8YYiyM1A0qR0f9rySarmftgUtwhk28Eo=;
        b=z4gdU6Jwwy0cp6WjQlbhLCMy1hURjoHKD0wnBIEyDaLpg1tKZOtFOXLReaV8mGLDig
         8Ma4CsRni16Q444eYpooYCSWWTwwkogqvR5/fMROM+JVK3JvDkszbdKX3Uy13tpqI35+
         V5/34TonLPNo458CEbRYltb79dFSXt0RSfdrMtdirvzQyVBo0MXiLdTwKbMy1+64usjB
         baTxEvUviJubT01PrloJ81/fhK/3x8U1XC7a8kvl3w64DIv4bldGr2aM47wm/SHKsBFh
         X88wCyx31GZ33zzLwO4LqrAZ5hRVjSDGrE0neDQmBOX7IdSIhbTbZImqtx4FvlRZKAqz
         9dww==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.187 as permitted sender) smtp.mailfrom=zhengchuan@huawei.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=huawei.com
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com. [45.249.212.187])
        by gmr-mx.google.com with ESMTPS id p8si1500078qtk.4.2021.10.17.21.25.04
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 17 Oct 2021 21:25:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of zhengchuan@huawei.com designates 45.249.212.187 as permitted sender) client-ip=45.249.212.187;
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4HXkDb49cpzbnCj;
	Mon, 18 Oct 2021 12:19:59 +0800 (CST)
Received: from dggpeml500005.china.huawei.com (7.185.36.59) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 18 Oct 2021 12:24:30 +0800
Received: from [10.174.186.51] (10.174.186.51) by
 dggpeml500005.china.huawei.com (7.185.36.59) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.15; Mon, 18 Oct 2021 12:24:30 +0800
Subject: Re: Questions about Jailhouse
To: Jan Kiszka <jan.kiszka@siemens.com>, <jailhouse-dev@googlegroups.com>
CC: Xiexiangyou <xiexiangyou@huawei.com>, <changzihao1@huawei.com>
References: <830ab7e0-e8b9-edc7-8a3a-4acdb8b0216c@huawei.com>
 <58cd66eb-1988-cef4-09bc-2438f790f7f8@siemens.com>
From: Zheng Chuan <zhengchuan@huawei.com>
Message-ID: <ff1a563e-1e41-dd4d-9899-67f8de4d11bf@huawei.com>
Date: Mon, 18 Oct 2021 12:24:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <58cd66eb-1988-cef4-09bc-2438f790f7f8@siemens.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.174.186.51]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500005.china.huawei.com (7.185.36.59)
X-CFilter-Loop: Reflected
X-Original-Sender: zhengchuan@huawei.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of zhengchuan@huawei.com designates 45.249.212.187 as
 permitted sender) smtp.mailfrom=zhengchuan@huawei.com;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=huawei.com
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

Hi, Jan.

On 2021/10/14 17:34, Jan Kiszka wrote:
> On 12.10.21 13:57, Zheng Chuan wrote:
>> Hi all,
>>
>> After reading the code of jailhouse, I have a few questions.
>> 1.Once Jailhouse is activated, the boot Linux will run as a VM. If it is=
 possible to run VM by KVM(nested mode) in the root cell?
>>
>=20
> Nope, but you can find traces of an attempt in
> https://github.com/siemens/jailhouse/commits/wip/kvm
>
OK. I'll look into it.

>> 2.I wonder why the root cell need to runs in guest mode? Whether jailhou=
se can run root cell in host mode, create KVM VM inside
>> root cell. So jailhouse can support both partition and VM.
>=20
> Two main reasons:
>=20
>  - security/safety: If you leave the root Linux running in host mode, it
>    becomes part of the trusted code base, increasing it by a "few"
>    orders of magnitude
>  - functionality: only by intercepting certain I/O accesses, Jailhouse
>    is able to emulate the ivshmem devices
>=20
OK, I got it
>>
>> 3.When create a non-root cell, the jailhouse driver executes cpu_down() =
to offline CPUs, but the offline CPU seems to be running
>> and respond to interruptions. And the hypervisor seems to have done noth=
ing to wake up the CPUs(assigned to non-root cell),
>> or did I miss the important part of the code?
>=20
> The offlined and then "stolen" CPUs of the non-root cell are first
> parked and then finally started again at (amost) architectural reset
> state when doing "jailhouse cell start". On x86, you can see the SIPIs
> being injected for that in the Jailhouse log.
>=20
Yes. However, I am still a little confused about the status of "offline" cp=
u.
i. On x86, is it at real mode or protected mode after we do cpu_down() with=
in vmlanuch?
ii. is that different from cpu_down() of host?
iii. on x86=EF=BC=8Cdoes it conflict with the bootstrap of linux guest sinc=
e the kernel will do transform from real mode to protected mode?


> Jan
>=20

--=20
Regards.
Chuan

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/ff1a563e-1e41-dd4d-9899-67f8de4d11bf%40huawei.com.
