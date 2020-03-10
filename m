Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB5GVT3ZQKGQEVEQOZWY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13b.google.com (mail-lf1-x13b.google.com [IPv6:2a00:1450:4864:20::13b])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6731800E5
	for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 15:57:57 +0100 (CET)
Received: by mail-lf1-x13b.google.com with SMTP id l10sf2583190lfe.8
        for <lists+jailhouse-dev@lfdr.de>; Tue, 10 Mar 2020 07:57:57 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1583852277; cv=pass;
        d=google.com; s=arc-20160816;
        b=GjWcjsOcYI6iD0gOD47s76EHipwBDHlQcA2OmIAkUooBZfBnhpDdqelLXAH2wByZsN
         eNqMBFBIbC8x5Gf2rsGvjAGPqjon1IoEdSOnhKQNMBxQU9vnN5fyzXN8fcGnJU6z62J9
         AjbhjjHLbXpdiThwehuewiVJuOw5sFeUBvsn5CzPvRhj6SjTm5pjd4CCoL4k0Fm5Y1yC
         aqpou8R7li5LwTDE56cwGSL/tQxi/8SUhswnkvNCTDJG7+78dIwB+zPo0XmnEwul5T7G
         0H+LyOONihZIZoTUt37lemmqx+9OlaJsNA0VQ1PTYyk0gEcJf8ON3u7PiKlU7lQWEI8k
         fwWQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=ENd21pH4Fa1TuB8vn3K8bfIXz7/Et3dLjbEeFVk24yI=;
        b=jC6o5e+wxdtNKqeobT8nVGHU0bEUubNDbPoRg8V6eC6mWkyJgj7X6NwPj3byNYLnj9
         PR2GXHsLyJISeOwrTw7lSSZHQE62BEWmYBuoRZDBZDoe8EvwKqWS9ipYXBeVMib+8NgY
         p6TexhLCE4eX9qTm1esd7aOQ1DCCa5AyjuPDp1nyTMLRZ1RQdGPYOnPy2lhqz6hLp4UQ
         eYunE7zFuPc09HPcw4G3Lpc422FySaMWIjEARS3T/WwAdBKF9Vn/GDpmfXFFH6nnwdoy
         /l8OIeHnfRmJtvq8KIQkqjDQFAucII4/gVNrYQnHl2XsKwOtvabYmk00y6GsCTx2sgrG
         uBBw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ENd21pH4Fa1TuB8vn3K8bfIXz7/Et3dLjbEeFVk24yI=;
        b=RTIojVtx78eRuG3rS3b4MLyVHnWoE2sktW1xAOBsvV6cTTufjRRhnijhXy2rdfiH1w
         sBhvBcwvtZvq3yp+uA1PuBgh0+GAkqrNoVwksR+vtpxnz/r0XFt4Omlquw83ANYlXpHJ
         GLJf5v60Zf0dJLJVo73z1sfQx/efJK/sJgWRYyaqoF+s7g48o6KdGESo5Ugzbi6/Oh2G
         pECIjq/mGSbarNp+LbQxaGSl1EMX3fOTTegyH3QOIG5CFtNMbKcidx1eRGNy5Y951VtH
         To0vLExBJRtloA/oCogHms5TEsB/C9MAw8dy/PF02G+LG7o/q57g8lNDqiSj+Vjh36ce
         zrog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=ENd21pH4Fa1TuB8vn3K8bfIXz7/Et3dLjbEeFVk24yI=;
        b=ufrcyBk84XL5CW2zm5+W3hqDm5WVA3V8c/PjYud3qlJx1ck2ttJQmojnBpk5Hddks5
         QiuFjiSNEETcXgMQg8n9FuzShc7vXjEGT+B3n2FDYCJ0bhZHTaXHfgsQAU/AySTG9hQf
         whIWWny9KEy4ryQ8+66/cazmr8/Q8zXIC6m/xwyHROc351xLE6i/LMOy3BMkShauSWJv
         2VGz/rzmfv1GNOHk3FmLkPwrhP5W8FO4tA8vL9QTZOIaExb4Z7MNpJs8axqlaSr2St7I
         D6TnQhqPHOl61fxlJgaV94R/UKjwdLgKW2g2USm7omAi1abCqxd8oH0LIItT1dAzwn1e
         7GPA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANhLgQ3AK1Ji2Wex1nPs7jYaSRu2S2I2iRdEO/IrUV9vnkMRzimD+igx
	OF8YRAQMMHATeIXTJcVtrBw=
X-Google-Smtp-Source: ADFU+vs/vCITHTaT5C1tnlCOyA3o5xCuXuqGRKVZpK3JXtRLl0mBprhRaHmcxuORsD2wtCQm90JzrQ==
X-Received: by 2002:a2e:b4e5:: with SMTP id s5mr1011056ljm.190.1583852276902;
        Tue, 10 Mar 2020 07:57:56 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac2:5476:: with SMTP id e22ls1880263lfn.7.gmail; Tue, 10 Mar
 2020 07:57:56 -0700 (PDT)
X-Received: by 2002:a05:6512:692:: with SMTP id t18mr12687464lfe.212.1583852276041;
        Tue, 10 Mar 2020 07:57:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583852276; cv=none;
        d=google.com; s=arc-20160816;
        b=XMkpDYNOIzUNqMHskIpANIYW7t3mnD9kVSJ+ttw6IE1RbYcD/qEVQaYFbXbWs/mBmp
         7zu+GJYlSiplnDxr6J5X69CAFOB3nNo6XpZMUyXY/tC6EU+YtM9DiwqjShOPnRm0tb1I
         j2sIz72meN7qg5EBeUC+DwzhDQBtFlR5UHR3LoGJKUV7S6+NjmgfnCYdbXHJ5UaMfO7j
         Hiitwbw7CIx8Z4Mh6J5zicecUmBrDCx21jlrLbgapA1bnmpO+aUlihIYhabwjnkPQJXP
         l7FMW+OE1Jc6/NoGdMxRZRYkzVcuSS+NpJaXUWJDhmcozIx+suzHkPp6I3ApCMe7C36J
         NZdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=E2L8n2GGhHDXMOGcdZ761EHYTYZcPXwvQZBcbKdvcxs=;
        b=vY+EKnoBer18OIKLn5OMyWOjRPyjd1IaaO/3JXc91vw2YzWfZhZjyU9hvo6zxhkhWN
         Ls9b4ZwV6TD9WStpz+X7AdmqxfsMBzbTiBmzXaCEVXv2B2tUEhoij/fhygm5zJRWSG7V
         0JE//45UGC3JHi4YbqccFqigfdYNZfKLXuYDPFfBYy2ayxLnk/lzyXqfH9/tF/xIeZuM
         3XNzWblnq1b6J3ybsO5KF3n0pNFefAwQMeikvkMF/4t2qvWuKIt9WE+6zaShC3QEKAyE
         jqMzWm8E97jfViG/RZT+53/eAZK2l+JwbIscmbLwhmkb4ieVW56KTzRw4nBoRXTwfjsr
         aOkw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id p14si393062lfo.0.2020.03.10.07.57.55
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 07:57:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id 02AEvtmF006845
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Mar 2020 15:57:55 +0100
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 02AEvtf5032693;
	Tue, 10 Mar 2020 15:57:55 +0100
Subject: Re: Jailhouse TX2 and GPU?
To: Patrick Uven <patrick.uven@offis.de>, jailhouse-dev@googlegroups.com
References: <202002281443.01SEh8Ta028765@opswc01.bsc.es>
 <6a16a1eb-a0d7-da01-848c-107b56c6f114@siemens.com>
 <96ecb1bd-8761-dce4-e20a-d008e4b9dab0@offis.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <9477704c-3573-bdfd-5421-3fa11028f460@siemens.com>
Date: Tue, 10 Mar 2020 15:57:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <96ecb1bd-8761-dce4-e20a-d008e4b9dab0@offis.de>
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

On 10.03.20 14:11, Patrick Uven wrote:
> Hi,
>=20
> I would like to continue this conversation, as Alvaro is most likely
> working for the same project I am.
>=20
> On 2020-02-28 19:58, Jan Kiszka wrote:
>> On 28.02.20 15:43, Alvaro Jover Alvarez wrote:
>>> I found very interesting your work in the jailhouse software. I'm
>>>  =C2=A0=C2=A0replicating every single step for its integration on the T=
egra TX2
>>> and so far I got jailhouse running bare metal.
>>>
>>> Now, I was wondering - what is the status of the project?. Did you
>>> ever manage to run anything inside jailhouse inmate using the GPU?
>>
>> If you completely assign the resources of the GPU to a cell, this should
>> work. But I don't have a TX2 to try that out. Adding some folks who have
>> some in their labs and maybe tried that already.
>=20
> I was able to create a few scenarios which all did not work out as hoped:
>=20
> 0) Using the evidence port[0] of Jailhouse 0.9 for an old version of
> L4T. While this works, it is obviously a quite old version of Jailhouse
> as well as Linux (4.4). Is this the version you were using Alvaro?
>=20
> 1) Using the newest version of L4T and the provided kernel I was unable
> to build the newest version of Jailhouse. As you already mentioned in
> another message regarding this topic, Jailhouse tries to restrict
> support to mainline kernel wherever possible, so I tried that next.
>=20
> 2) At last I was using different mainline kernels on the TX2 without
> much success. Trying versions 4.14, 5.4 and 5.6-rc5 I wasn't able to get
> much more than a booting Linux which a console via UART. No HDMI, no
> network (not expecting an answer here for those problems, just
> interested if this should even work). Using the LTS kernels Jailhouse
> would fail to initialize (when using jailhouse enable some CPUs fail),
> using the latest RC I was able to enable jailhouse, but ran into memory
> errors when creating an inmate.

You may see different resource layouts with mainline due to different=20
device trees etc. So, it's essential to keep an eye on /proc/iomem and=20
make sure the config is in sync when it changes.

Furthermore, when you can errors, please use CONFIG_TRACE_ERROR and=20
report the boot logs of Jailhouse.

Jan

>=20
> So overall I wasn't able to get a current Jailhouse version running on
> the board at all. While I guess we can ignore scenario 0 and 1 as they
> are out of scope of the current Jailhouse development, I wonder if there
> is anyone that can confirm that scenario 2 is working. I'm not asking
> for a step by step solution, but just getting some information on a
> setup that should be working would be nice -- especially if the GPU is
> working in an inmate as well.
>=20
> Regards, Patrick
>=20
> [0]https://github.com/evidence/linux-jailhouse-jetson/
>=20

--=20
Siemens AG, Corporate Technology, CT RDA IOT SES-DE
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/9477704c-3573-bdfd-5421-3fa11028f460%40siemens.com.
