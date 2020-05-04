Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB3OJYH2QKGQENNGN35A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x137.google.com (mail-lf1-x137.google.com [IPv6:2a00:1450:4864:20::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 28CE41C4672
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 May 2020 20:54:38 +0200 (CEST)
Received: by mail-lf1-x137.google.com with SMTP id h17sf2822246lfc.12
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 May 2020 11:54:38 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1588618477; cv=pass;
        d=google.com; s=arc-20160816;
        b=Hy3aqTMKx7fz8JZeq88caW9y1JT8eRt7pXtOIT8+bu34nXCRDKF7XOSaowJNGot6cS
         oGChf1z42KGZtEvi+AWrYO3+JgTAJIUJ9Mko7RmdjttD6LClq8OLk1JD5f1IQDxmxy9y
         N+3ChgaYwfvyPD7vZok26f1B0ou99xPYVV8KT8RdBFNIOmU1LH+LpmKmG4WN93hCeoGb
         GlJArsPXksMOyq1Ai187fGbzwzp7niX97atot4Esi8HspZKZ740wq/jgQCWGITEQulKo
         t5DRFlhcEFSi7ayWRQrsraBv16PJU7pJK48cro1IWTkqZ1y79EqdYgoYlGB5yB4vGw7l
         qzdg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:cc:to:from:subject:sender:dkim-signature;
        bh=Q1ZpvkSSXWlaxdoEpkekEXL+VVnZniO3hieL/iV6Fj4=;
        b=rVQPXiSzrHvNVSdoPxAZWom4N08HO57LzHnMDXZDlDDHvXNUamyNab2Z7i/D8AB3It
         g5LJ6jzolupnmH5v8tldOeYTz6yuDO0lKOq9m8FI9VhZ0he8E2Ysm1u/JxhHR1c3mNOi
         s1Gku1mmNGNDbh7vcwl7cw/b23GUFau4Jb56MH36Rrnrtb2sV2SQOHeFxMfnaIr2kYea
         8FNElDrn4TRzPucqsFVMfQItSPMwVfFTrl1d6Xa4NnKJ1yDWgSxV9xx3kdBRJ22NvLrn
         iAFSqnGzq3OUe/KRHa/weGDFcOEUJjkmbgTge6O5yBuD2Q41EZBjfDMRz8xCnezNscFe
         HT8g==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q1ZpvkSSXWlaxdoEpkekEXL+VVnZniO3hieL/iV6Fj4=;
        b=Yccf3eH2xlcMxdNkgdw2xE2Kkeskq2lVZr8WDjTmcRMyNr1iJiZXIc33cdcBkCSCFS
         0YfNcqst+m/U072QJGmb8Ri2T0M80Wymyo1KimVfwUlHgDTu3EiGqAeYwJJSxSVZEhwr
         t+Sq84tpTl9S5Zpk6OX5Cn+SyVLsFAN8o2qk1AlV1cHhfDL2aJPG4IRF8aa7ihbfizcx
         bNTpgfVCFFpCI+UHpSakAWRMT9dF7XA1zCP2VeJODcJxQHGVzgKCmKm0G5N2wyR2shAW
         h3DwMIIGa0CqKTSOc1ji2sayLYJTon2MeN8ZKSyAoHHtxLnBFiitxdTKPzt0H2iKFfdj
         bL2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:from:to:cc:references:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Q1ZpvkSSXWlaxdoEpkekEXL+VVnZniO3hieL/iV6Fj4=;
        b=Vfeo45Gd0F8ZbpL1fotoC5XLGZM/CineXBNeRDOajQdZPbXiWgFhNOjiSEOSi/Zw8M
         k2TTsTwNeEnmWTA+1nycGXSKuXE26G6GPtICIJOQoWZVcwAhnxUMebJR6fl6f2B1kFfO
         KM6k9OVhu9PDrvhE9wRjz6szS8xJbnqdLN9e3d3mOrafPub4yWhZ+KfSRdOxYJikNIu9
         v/PAHdJ8zHlQtcpDDIe2PEbsW8n8VLTbByXLlAQtnIFKv4q7D6+q74GRxWlLUtSXAAa4
         Mvn55edlC0tkHDkbdokM+e9MfOOBSpzeC9E23eDL+X9anmeZAd5sgzOMEBzmnPtcDicX
         xI3w==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AGi0PubUWosnr1eTCVfAXSst++Uo5JI0hXhiAwt9QdSnfP48MevT0ZUP
	FrHiCelIZ3HxSW18jyNlsAY=
X-Google-Smtp-Source: APiQypJe3Y3g5ktvBxB8ItxWSW1YPePlqopu5bBtCZI1dwyfCVc2OamdA8/tNpEyVYxRCYQSmyhE0A==
X-Received: by 2002:ac2:4d18:: with SMTP id r24mr2679010lfi.51.1588618477699;
        Mon, 04 May 2020 11:54:37 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:3a12:: with SMTP id h18ls3025001lja.1.gmail; Mon, 04 May
 2020 11:54:36 -0700 (PDT)
X-Received: by 2002:a2e:3813:: with SMTP id f19mr11116169lja.216.1588618476753;
        Mon, 04 May 2020 11:54:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588618476; cv=none;
        d=google.com; s=arc-20160816;
        b=mX4O5H4rEI07x4Y3crG7ltZjsH6f2eTxDUsi7A7jJOTVIF+KuwjfnxPxA0seUjhKT7
         Q3YkUraEP2rScu7a6qaP/o5rVt1qPuGEOXnOgsd0N5vtLp3bQ6hAh2nCG4EDlKwmt2u/
         ghP7Qd1mpEIk7NlHs7579kxnHquaiH+U+8U4VMD3idPWMIPG/RfoBF7BoH8vLo3VtqLk
         7evq+9cx6d2CNBWy0MSIWd/vRPz13UQW8/RLH/JorV1XiYIsdIntVNKPWC8yPB8wwOeu
         C+il//r0VU2dmkTTP7/Y9fyDXt/w3FpBA5EvX1+yotZVtDDZvglmCU11Z+QevD4+OIzS
         YkVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:cc:to:from:subject;
        bh=Ei2ikDp88/Hobbm2kBbhwPT1C2rttaX/L6l02WMWsc8=;
        b=BAxAghC4e5yt/2jURVV8yK/Zgt4lAO+g8HFuYG83Bdihm0sx1uXOMVGo/oWtQcHgdl
         lbEmWrxhWVxavLOIqI/mlVvkDA61d3yqKQH1mT3b5tI47kigjCS5DGiN53pW+M1nHNHF
         NmCO2N44FoZdOToVu5Z8CPEDTcKyUFqoNOnsLmW5eN1tKl7dXNE+Mw8GlkxfCVXmLQLH
         Hg0E+UPRXIo/LJoy/lS0fy7zcb3jYtnCwEZeHUYfa8u91kamO4tMUTbCApHBSbu/euX/
         KdVNSOYQP4uRU28nhRr2H4zbOh5ZztxvwdNc/ySoqSSgSVDdyHf/v1g1MV9Iz/MM9rMD
         rY8w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id q24si838037ljg.4.2020.05.04.11.54.36
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 May 2020 11:54:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 044IsYxH016147
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 4 May 2020 20:54:34 +0200
Received: from [167.87.53.26] ([167.87.53.26])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 044IsW7k005446;
	Mon, 4 May 2020 20:54:33 +0200
Subject: Re: [PATCH 0/8] Add cache coloring support for Arm
From: Jan Kiszka <jan.kiszka@siemens.com>
To: Marco Solieri <marco.solieri@unimore.it>
Cc: jailhouse-dev@googlegroups.com, marko.bertogna@unimore.it,
        tomasz.kloda@unimore.it, giulioc@xilinx.com, claudio@evidence.eu.com,
        fabio.federici@utrc.utc.com, Luca Miccio <206497@studenti.unimore.it>,
        Angelo Ruocco <220530@studenti.unimore.it>
References: <20190327121849.1882-1-ms@xt3.it>
 <7e92c41e-12a5-28fd-b1fc-4949e5ccac20@siemens.com>
 <20200422072259.sc2au24ksnt6j7jy@carbon.xt3.it>
 <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
Message-ID: <c25b626d-2aab-2ccd-f129-40e8b525a232@siemens.com>
Date: Mon, 4 May 2020 20:54:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <9605c893-d940-ce35-8301-832d31382c88@siemens.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as
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

On 22.04.20 10:51, Jan Kiszka wrote:
> On 22.04.20 09:22, Marco Solieri wrote:
>> On Wed, Apr 22, 2020 at 08:42:32AM +0200, Jan Kiszka wrote:
>>> On 27.03.19 13:18, Marco Solieri wrote:
>>>> Predictability of memory access latency is severely menaced by the
>>>> multi-core architectures where the last level of cache (LLC) is
>>>> shared, jeopardizing applicability of many Arm platform in real-time
>>>> critical and mixed-criticality scenarios. Support for cache coloring
>>>> is introduced, a transparent software technique allowing
>>>> partitioning the LLC to avoid mutual interference between inmates.
>>>> [...]
>>>
>>> Thanks for updating this! I will refresh my caches on the topic and
>>> provide feedback soon (I already have some questions and remarks but
>>> I'd like to double-check them).
>>
>> Looking forward to hear from you.
>>

Done with the deeper review. Overall, the series looks fairly good. I=20
see just two bigger open issues:

  - inmate loading interface
  - more architectural independence

But I think those should be solvable.

>>> As you likely read, there are better chances in sight to also address
>>> the root cell issue by booting Jailhouse from a loader.
>>
>> I share the same view.
>>
>> On the other hand, it ties the cache colouring with the
>> Linux-independent boot.=C2=A0 This is not ideal from an quality perspect=
ive,
>> because it introduces a dependency between otherwise unrelated features,
>> including one definitely optional (as long as Jailhouse will stay a
>> "Linux-based hypervisor").=C2=A0 Also, from a process perspective, it fo=
rces
>> the colouring-related activities and deliveries to be postponed after
>> reaching a somewhat stable architecture for the independent loader
>> (colouring pages is a loader matter).
>>
>> The other option is the hot-remapping of the root-cell memory, which we
>> already wrote and tested on an older version of Jailhouse extended with
>> a SMMU support.=C2=A0 From a quality perspective, it looks comparable, a=
nd it
>> does not introduces constraints on the development process.
>>
>=20
> As pointed out back then, there are still open questions regarding the=20
> reliability of such a hot-remapping approach, besides the complexity.
>=20
> Anyway, we now do have SMMU support in Jailhouse (first issue to report=
=20
> against your series, patch 9 ;) ), we could look into that systematically=
.
>=20
>>
>>> That would then leave us only with the question how to handle the
>>> hypervisor itself /wrt coloring.
>>
>> Correct.
>>
>>
>>> Provided that can buy us worthwhile improvements.
>>
>> We already have experimentally proven on two other hypervisors (Xen and
>> Bao) that the interrupt response time hugely depends on the cache
>> performances of the hypervisor's routines for guest injection.=C2=A0 Cac=
he
>> partitioning is therefore mandatory for predictability.
>>
>=20
> What measures did you apply on the hypervisors? Replicate the code into=
=20
> memory that has the "right" local color? Ensure that core- and=20
> guest-local data is in color memory? How did you handle naturally shared=
=20
> r/w data structures?

These questions are still open. I don't see hypervisor coloring as a=20
must-have for starting to merge things at all. But I'd like to have some=20
idea of the structures and interfaces we merge will not cause massive=20
breakages when adding that later.

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
jailhouse-dev/c25b626d-2aab-2ccd-f129-40e8b525a232%40siemens.com.
