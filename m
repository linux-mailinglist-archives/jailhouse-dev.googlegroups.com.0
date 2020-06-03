Return-Path: <jailhouse-dev+bncBDL2JD42SEIBB7MB333AKGQEOCDCAWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-oo1-xc38.google.com (mail-oo1-xc38.google.com [IPv6:2607:f8b0:4864:20::c38])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF6C1ECDD8
	for <lists+jailhouse-dev@lfdr.de>; Wed,  3 Jun 2020 12:52:47 +0200 (CEST)
Received: by mail-oo1-xc38.google.com with SMTP id n15sf1315122oov.22
        for <lists+jailhouse-dev@lfdr.de>; Wed, 03 Jun 2020 03:52:47 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1591181566; cv=pass;
        d=google.com; s=arc-20160816;
        b=XFYHnzFi5J22GDkSpGfTZQE8VRmNX2xHkOWA37Xl4s9moA/+XRyNXoypTRFc6IjNkk
         EsUYbn0Mi4ukMSC5yVE37J1cEo90F+BJsmZKe2J/TQJyIRKFciXODGs6ivYJV0mJsZjD
         chGQknqcGCFwwp8Vhokd/+LCkwO8oSgPLlsl6NdjduRjVFB1GUCRirXi7vNtMzN2GwsT
         bKul62U2K4cRHFbZibXywNjqhnUhvJ7G0+vl+QbMCvt9wS/KUY1s3eN9Ao4iiNeAmI8/
         67Xu1UUJXxD5zipOYUwjzxGRv0fqoP6u55DUlq1kJVjqWP5zGD9JfhI6odo9iwMCRAKJ
         eXxw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:reply-to:content-language
         :in-reply-to:mime-version:user-agent:date:message-id:from:references
         :to:subject:dkim-signature;
        bh=Ei3f5SorP8/oCQX8s+NWN/8vjzZooImCSVas1KLsvgg=;
        b=VEFqiYff98rYEsnpd0bbabGnDNGy+oc7lfZQhAitHmvceJmwEbXYCs5UykV5HKM1gf
         vFESOUwbdtSy0SgmzKrtfXrmThfEAss+RU9vq0NnN5RJukrCvtlmvE/DPgFoiMz2MEKI
         C/poO6Kkr8nQs8Mowuq22WE0yk5GZJM+eqTyVG98miR3UiGVL/K4ViWX31gFDgxtCZ9s
         fXC/YohPvNBj/+ss4sP/l0UpRucfI5GJmjdCGZbVlC+L8iT89AEQs9MrUecyUmPxsHJb
         Q0z5xeVyOxT51FwJOiGInfFiTkAjjReBII7OBWvUOe+SYW7JgcoSl9/1TDgMF5UsOwKi
         EtFQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mSD4ttRs;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:x-original-sender
         :x-original-authentication-results:reply-to:precedence:mailing-list
         :list-id:list-post:list-help:list-archive:list-subscribe
         :list-unsubscribe;
        bh=Ei3f5SorP8/oCQX8s+NWN/8vjzZooImCSVas1KLsvgg=;
        b=ryaqTQgztLl+CnFRd0Z1vgKWSf7/ykhNV6se9nDKMGtKerO3OHyn4gYPM4bElG1aZr
         NSMPsoYgX44ZULQfpSAJHl6Mi9L2tqiUw/Go8jMdx8BCbmHmZxzzcKG6SuWLdb8lRTfh
         pfVkiKlx/SrNdQbj9wznjIoYbKCyhBP4FF6EJ8zCvjMUwi6QNk5MtfW9LKsaoP3gPPzS
         CjMyj9GvjoUK+jc/P4YToMnk1e0R8CRCjfQMMTJsnOCu6/QQGCqHo8f0r5jO2YCzfbB6
         snWmBqB0gUXO3cGuVv0Szd931t1eEId7kOghc/UAHN5Prhw/FfjMRaCkt7euH8+30Tnj
         Lvpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :x-original-sender:x-original-authentication-results:reply-to
         :precedence:mailing-list:list-id:x-spam-checked-in-group:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=Ei3f5SorP8/oCQX8s+NWN/8vjzZooImCSVas1KLsvgg=;
        b=BMgeRsUFsT3KaJSYbwtq90InoG5jNWJl2CYMcXYKEul9liMDKMmUYNcj+xlsro/DBe
         Vf012Ihb1QrVmdmZCbh0SrGEqLOVwx82JkVGRbdu+b/87no2X4XnUfc8mb5ukm58IXcP
         i1TNiEqwgK7/pf1mj/3psGcdFtoFjpw2vLrxFDnQRiNptcFUOjw1oBIXVmkoFd++Pyih
         xuzH1RMrNyn3a3kYy6DEv/ZPtPZGzoH1gDTCh402VtDC7LYRmr/pcN2UrkNDAcylGN1t
         fk2ThyyQ3CCmTNUUZTRlpBZXkGfl0wsnSwpcGkG/5ffJJhMdiDfVi/xMDPDdtMVVgHTw
         QAsA==
X-Gm-Message-State: AOAM533omV2U+UO0YPZfCxCk2zNwjR29C+9JA38Nmrpt3/F9b1np6w8H
	LvsDtw2t+XcaMmzihWEGaKs=
X-Google-Smtp-Source: ABdhPJw+zJQRJnQeH+g/gqjEUxXxH47k9wFrfCQkR/VfLDW21Pcxc7i4HG+Hn6zgVHM9ND4UV7sViA==
X-Received: by 2002:a9d:2253:: with SMTP id o77mr2691506ota.236.1591181565997;
        Wed, 03 Jun 2020 03:52:45 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a54:460f:: with SMTP id p15ls346438oip.7.gmail; Wed, 03 Jun
 2020 03:52:45 -0700 (PDT)
X-Received: by 2002:aca:7213:: with SMTP id p19mr3858860oic.58.1591181565517;
        Wed, 03 Jun 2020 03:52:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591181565; cv=none;
        d=google.com; s=arc-20160816;
        b=r0hOyTqA+XLD4WAmF83x92uiF56//3bJYR1kAulQfjLA/UVc5+re2N7em7pqIxdgoT
         JGglK2V9czCJJlvA0HawU4oCbfj0QcB3/7ocQt0tL2K/NdgnozK7NCjPoJo9IztqmQOy
         pILOxUPbbIclepOh0IDIKWwp3iMuH+QcY6bLKB6LYmyD1dUY4RKs/726mvBg43LmL5yY
         Oupf7iMYP6n4uvBOPaqhqzy519xuQykAt421frUmNL2Je3Pnlxt8fbRTu3rao6pCPFTZ
         tDv77a/Vz7jQ3rZ8CjVhkjM3oUqW+eKdxSzCsNsesNiSaQA85X4ATxhUYxwDih2AWata
         EARA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ymz22QIsGYDPGqJom17QKi8aLK+Ak/vY4svqzrAaEWA=;
        b=N6xo9fHhftGsuTxE/xxyNrw31RiETP2XG1BDRV2sJB4F9pTnBqSMLK5DjkpcM4KkcD
         V9QEzg2tq8g2OeG+PuycNxR6E6Gh8c4PYhFK9n2P1Oh4j9LIJ0uQy590FWrZnBFszAmS
         PiKg4zKuK1qVdgnw+/q+03y6H9myCXeguRK30lqO4Dqh5CC32/bvgF6HJ0izbYYYHPD6
         w73ayAV+0p61SaonBdbPULrXk8Q+AIZouXDIf1fqHjwAEfBxqlf6CEXFwbw3CwJsRhhO
         Y1aMypWkOw6BEmN07MZ8Eqs9NhvmqqP5qMMIzz0z5x+RE6bDrtArO9c0GnfU6oKU37WA
         obbA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=mSD4ttRs;
       spf=pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) smtp.mailfrom=nikhil.nd@ti.com;
       dmarc=pass (p=QUARANTINE sp=NONE dis=NONE) header.from=ti.com
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com. [198.47.19.142])
        by gmr-mx.google.com with ESMTPS id e69si146954oob.2.2020.06.03.03.52.45
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jun 2020 03:52:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted sender) client-ip=198.47.19.142;
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 053AqjY4119380;
	Wed, 3 Jun 2020 05:52:45 -0500
Received: from DLEE103.ent.ti.com (dlee103.ent.ti.com [157.170.170.33])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 053AqjOk101340
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 3 Jun 2020 05:52:45 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE103.ent.ti.com
 (157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 3 Jun
 2020 05:52:44 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 3 Jun 2020 05:52:44 -0500
Received: from [10.24.69.115] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 053AqhuN020561;
	Wed, 3 Jun 2020 05:52:43 -0500
Subject: Re: [PATCH] arm64: ti-pvu: Panic on errors during config_commit
To: Jan Kiszka <jan.kiszka@siemens.com>,
        Jailhouse
	<jailhouse-dev@googlegroups.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <f87739b0-2990-1229-4cfc-105c36f4efa5@web.de>
 <9528c94f-c351-7ac4-889c-6d422be130ca@ti.com>
 <5badd0af-e586-fa58-f3f4-9aed052fd04d@web.de>
 <a826d22a-1c54-3962-b42a-085a8df872ea@ti.com>
 <c1c8004d-b46d-fb4a-b4d8-5556ee8b87c8@web.de>
 <596d4db3-2af9-df01-3090-dad8c347eb77@siemens.com>
From: "'Nikhil Devshatwar' via Jailhouse" <jailhouse-dev@googlegroups.com>
Message-ID: <2255653f-e329-7515-17cc-ed44eba962ce@ti.com>
Date: Wed, 3 Jun 2020 16:22:42 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <596d4db3-2af9-df01-3090-dad8c347eb77@siemens.com>
Content-Type: multipart/alternative;
	boundary="------------5D105494496BADA82D3660D2"
Content-Language: en-US
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Original-Sender: nikhil.nd@ti.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@ti.com header.s=ti-com-17Q1 header.b=mSD4ttRs;       spf=pass
 (google.com: domain of nikhil.nd@ti.com designates 198.47.19.142 as permitted
 sender) smtp.mailfrom=nikhil.nd@ti.com;       dmarc=pass (p=QUARANTINE
 sp=NONE dis=NONE) header.from=ti.com
X-Original-From: Nikhil Devshatwar <nikhil.nd@ti.com>
Reply-To: Nikhil Devshatwar <nikhil.nd@ti.com>
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

--------------5D105494496BADA82D3660D2
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable



On 02/06/20 8:16 pm, Jan Kiszka wrote:
> On 11.04.20 20:55, Jan Kiszka wrote:
>> On 11.04.20 20:37, Nikhil Devshatwar wrote:
>>> Hi Jan,
>>>
>>> On 11/04/20 11:28 pm, Jan Kiszka wrote:
>>>> On 11.04.20 19:25, 'Nikhil Devshatwar' via Jailhouse wrote:
>>>>> Hi Jan,
>>>>>
>>>>> On 11/04/20 4:31 pm, Jan Kiszka wrote:
>>>>>> From: Jan Kiszka<jan.kiszka@siemens.com>
>>>>>>
>>>>>> So far, any error returned by a function called by
>>>>>> pvu_iommu_config_commit was ignored, only reported to the console.
>>>>>> That
>>>>>> would have resulted in an inconsistent configuration being run. Also=
,
>>>>>> pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors at all,
>>>>>> and
>>>>>> the former also returned an incorrect code then.
>>>>> This is because I have implemented all the functions with return code=
s.
>>>>> I have implemented the pvu_iommu_config_commit with int return type.
>>>>>
>>>>>  =C2=A0From the design perspective, the pvu_xxx APIs are written from=
 any
>>>>> place.
>>>> Nope, they aren't, I checked that.
>>>>
>>>>> It's the config_commit call which is nont returnable, So that functio=
n
>>>>> should panic.
>>>>>
>>>>> So, the only place for panic should be either in the
>>>>> pvu_iommu_config_commit
>>>>> Or, in the iommu_config_commit
>>>>>
>>>>> Regards,
>>>>> Nikhil D
>>>>>> We rather need to panic-stop the system in case some configuration b=
it
>>>>>> cannot be programmed because there is no way to roll back from a
>>>>>> config_commit by design.
>>>>>>
>>>>>> Signed-off-by: Jan Kiszka<jan.kiszka@siemens.com>
>>>>>> ---
>>>>>>
>>>>>> I wonder if there isn't a way - provided it's not too complex - to
>>>>>> build
>>>>>> up the programming during cell_init/exit, validate it at that chance=
,
>>>>>> cache it, and only apply that state on config_commit. Would mean les=
s
>>>>>> panic.
>>>>> I gave some thought to create the data structures before config_commi=
t.
>>>>> But as of now, there is no way that exist.
>>>>> Following is the sequence of calls
>>>>>
>>>>> pvu_iommu_map_memory
>>>>> pvu_iommu_map_memory
>>>>> ..
>>>>> pvu_iommu_map_memory
>>>>> pvu_iommu_config_commit
>>>>>
>>>>> There is nothing that gets called from framework, and there is no
>>>>> way to
>>>>> figure out if the pvu_iommu_map_memory is the last call
>>>> OK, so none of the error conditions can be predicted from the given
>>>> config and current configuration due to the unknown upcoming mappings?=
 I
>>>> don't thinks so. E.g. the alignment checks in pvu_entry_write(). The
>>>> entries checked here come from a a cache, and that is built in
>>>> pvu_iommu_map_memory where we are able to return a proper error.
>>>>
>>> All the alignment check errors are defensive programming only.
>>> So it can be guaranteed that these functions will succeed when called
>>> from the
>>> config_commit, except the alloc_tlb failure.
>>>
>>> I can maintain a free_entries count per device and check if the entry
>>> count
>>> exceeds that. Assuming that the last memory_map and config_commit for a
>>> cell happen
>>> in order before any other cell's map_memory is called.
>>>
>>> This way, we can track the errors and fail the cell creation.
>> That sounds good.
>>
>>> I would still recommend a return value check and panic to track bugs in
>>> the entry creation logic.
>> If there is a real risk that invalid configs we can't catch earlier or
>> unexpected hardware state can get us there, yes. For all other cases, I
>> would rather recommend to sit down, check the code more than once again
>> and exclude programming errors upfront.
>>
> I hope this issue is not forgotten, just in the backlog.
>
I will send v2 for this fixes

Regards,
Nikhil D

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/2255653f-e329-7515-17cc-ed44eba962ce%40ti.com.

--------------5D105494496BADA82D3660D2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF-8=
">
  </head>
  <body>
    <br>
    <br>
    <div class=3D"moz-cite-prefix">On 02/06/20 8:16 pm, Jan Kiszka wrote:<b=
r>
    </div>
    <blockquote type=3D"cite"
      cite=3D"mid:596d4db3-2af9-df01-3090-dad8c347eb77@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">On 11.04.20 20:55, Jan Kiszka =
wrote:
</pre>
      <blockquote type=3D"cite">
        <pre class=3D"moz-quote-pre" wrap=3D"">On 11.04.20 20:37, Nikhil De=
vshatwar wrote:
</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">Hi Jan,

On 11/04/20 11:28 pm, Jan Kiszka wrote:
</pre>
          <blockquote type=3D"cite">
            <pre class=3D"moz-quote-pre" wrap=3D"">On 11.04.20 19:25, 'Nikh=
il Devshatwar' via Jailhouse wrote:
</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">Hi Jan,

On 11/04/20 4:31 pm, Jan Kiszka wrote:
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">From: Jan Kiszka<a c=
lass=3D"moz-txt-link-rfc2396E" href=3D"mailto:jan.kiszka@siemens.com">&lt;j=
an.kiszka@siemens.com&gt;</a>

So far, any error returned by a function called by
pvu_iommu_config_commit was ignored, only reported to the console.
That
would have resulted in an inconsistent configuration being run. Also,
pvu_tlb_alloc and pvu_tlb_chain didn't even report an errors at all,
and
the former also returned an incorrect code then.
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">This is because I have=
 implemented all the functions with return codes.
I have implemented the pvu_iommu_config_commit with int return type.

=C2=A0From the design perspective, the pvu_xxx APIs are written from any
place.
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">
Nope, they aren't, I checked that.

</pre>
            <blockquote type=3D"cite">
              <pre class=3D"moz-quote-pre" wrap=3D"">It's the config_commit=
 call which is nont returnable, So that function
should panic.

So, the only place for panic should be either in the
pvu_iommu_config_commit
Or, in the iommu_config_commit

Regards,
Nikhil D
</pre>
              <blockquote type=3D"cite">
                <pre class=3D"moz-quote-pre" wrap=3D"">We rather need to pa=
nic-stop the system in case some configuration bit
cannot be programmed because there is no way to roll back from a
config_commit by design.

Signed-off-by: Jan Kiszka<a class=3D"moz-txt-link-rfc2396E" href=3D"mailto:=
jan.kiszka@siemens.com">&lt;jan.kiszka@siemens.com&gt;</a>
---

I wonder if there isn't a way - provided it's not too complex - to
build
up the programming during cell_init/exit, validate it at that chance,
cache it, and only apply that state on config_commit. Would mean less
panic.
</pre>
              </blockquote>
              <pre class=3D"moz-quote-pre" wrap=3D"">I gave some thought to=
 create the data structures before config_commit.
But as of now, there is no way that exist.
Following is the sequence of calls

pvu_iommu_map_memory
pvu_iommu_map_memory
..
pvu_iommu_map_memory
pvu_iommu_config_commit

There is nothing that gets called from framework, and there is no
way to
figure out if the pvu_iommu_map_memory is the last call
</pre>
            </blockquote>
            <pre class=3D"moz-quote-pre" wrap=3D"">
OK, so none of the error conditions can be predicted from the given
config and current configuration due to the unknown upcoming mappings? I
don't thinks so. E.g. the alignment checks in pvu_entry_write(). The
entries checked here come from a a cache, and that is built in
pvu_iommu_map_memory where we are able to return a proper error.

</pre>
          </blockquote>
          <pre class=3D"moz-quote-pre" wrap=3D"">All the alignment check er=
rors are defensive programming only.
So it can be guaranteed that these functions will succeed when called
from the
config_commit, except the alloc_tlb failure.

I can maintain a free_entries count per device and check if the entry
count
exceeds that. Assuming that the last memory_map and config_commit for a
cell happen
in order before any other cell's map_memory is called.

This way, we can track the errors and fail the cell creation.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
That sounds good.

</pre>
        <blockquote type=3D"cite">
          <pre class=3D"moz-quote-pre" wrap=3D"">I would still recommend a =
return value check and panic to track bugs in
the entry creation logic.
</pre>
        </blockquote>
        <pre class=3D"moz-quote-pre" wrap=3D"">
If there is a real risk that invalid configs we can't catch earlier or
unexpected hardware state can get us there, yes. For all other cases, I
would rather recommend to sit down, check the code more than once again
and exclude programming errors upfront.

</pre>
      </blockquote>
      <pre class=3D"moz-quote-pre" wrap=3D"">
I hope this issue is not forgotten, just in the backlog.

</pre>
    </blockquote>
    I will send v2 for this fixes<br>
    <br>
    Regards,<br>
    Nikhil D<br>
    <blockquote type=3D"cite"
      cite=3D"mid:596d4db3-2af9-df01-3090-dad8c347eb77@siemens.com">
      <pre class=3D"moz-quote-pre" wrap=3D"">
</pre>
    </blockquote>
    <br>
  </body>
</html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/2255653f-e329-7515-17cc-ed44eba962ce%40ti.com?utm_=
medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailh=
ouse-dev/2255653f-e329-7515-17cc-ed44eba962ce%40ti.com</a>.<br />

--------------5D105494496BADA82D3660D2--
