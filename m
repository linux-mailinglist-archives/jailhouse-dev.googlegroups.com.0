Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZ7ES3WQKGQE3ROF6JQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ed1-x537.google.com (mail-ed1-x537.google.com [IPv6:2a00:1450:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 191D9D7588
	for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 13:50:00 +0200 (CEST)
Received: by mail-ed1-x537.google.com with SMTP id s3sf12026470edr.15
        for <lists+jailhouse-dev@lfdr.de>; Tue, 15 Oct 2019 04:50:00 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1571140199; cv=pass;
        d=google.com; s=arc-20160816;
        b=BHrO893rVD7WkBInqprRthyWxLtvNevJchwmdoEtCyLF78SOGADtqxHVJR8BFTFzs6
         Zjw2f7p8wtTZWEIvJUDaLF89JzUtodzEfOChPDVxdb+6G39EJEG+opmWmOZKSMw1wpvl
         R4E90g+NeONDgBBa9kJj//ZbNN9rTe92bTbg/b2pMZH19Wt2DbLFAzMfC13DTqhG0yFp
         eAWwT18cNThbdGzqQRyupsFs66v86EmvIuntp7GzAjrcGjItRf3hJg+rHQAlGxBQJNTW
         BpbMw3WnAMDLTLDfBiK1COCDe+0Z3mz9rWWigufpBKQ9wLCPITkbk7BS0p4I593oCY6v
         Otyg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=Gm7+93TA6OyyNi8WLowD8vB8byjEwKzOz42iS/JxYKc=;
        b=a9p2ojJxrr5MCRcZ/kLMWajBcv8rY26dTvgRoDzCP7yMVME68Zn1ABmdHd8/fHWuWS
         D1d/EGl8K/vIsfG/IfTKGAHrn6rllfI2UEE3s0RJOcNqSh/B/kCuT1fpkbURKehZA8Qb
         rB8r8/pdMZLbhrm8eH0TB65BgUJc61UFD7ekT64NQd164n2imoEZQrKg9Weo7EMitz5x
         b5IkCM+TAYCpYKgCB3NECyB7Q1wLJywA7Jwr0sy07qR6PlAGxbuUypY+8LHaS/cBxroG
         B2bjslSWBOSi4kkxRAKynRB5K029LQkMGNBhWH4rgmIjVbs8o8FbS4YeLC+9AnoRV5FC
         raNA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Gm7+93TA6OyyNi8WLowD8vB8byjEwKzOz42iS/JxYKc=;
        b=mGuWqWENTMNJKolxnbs7VwHUzxlvlFzNofgC4eBunG+GX9yKZaJq+YB+8r3FKi35MC
         VrqaXMXq+7VoIhibS/0lV4TGzJ/CYFRXBg0HG1u2mP07xdF7Q/DiSPur5l8NaZteRdiG
         A2lkVri4Ig9Rz/TNgqn5dm41BMH7w3Ui6P/OuCjSvv8R75T9WkL12dd/QI0IgbvhpTpg
         yASAJj6yUS6VEM0lSShwqNi1FOejqeW0sO/hSn6H7h2K+XErJRN8PO0Z36vKGXmH7Bjq
         daLjgrjShaSLwC8gO1+j13avPsElFdRQZvT3raGHPjaOcsTR3m9LgqbLHahkCeY88Qv0
         KccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=Gm7+93TA6OyyNi8WLowD8vB8byjEwKzOz42iS/JxYKc=;
        b=bKrimRrzWEyTQLFPxSaHl2yktdwcwWRQNJ9+mfKdvmULropHcij/eWFWxPHHcO1yS3
         sUdlak4RIL4sAkrbrD1Fu5UAORQZeydAaXBYgsi7Dl96gAykppx5XPtk39SaPPmN9Uyk
         6OVyd34WLEdOuMCoE5Cz0b6MXZA8VpyR25teqSZQwt9CJwBRwlDdDGUn4Dvy52euLuRf
         AESSW9DWgPcJCEkzMcbCB06p84CTZYFXx6R2+AlnEaCXCBvcWzQZO5JeRLovs3gZfeym
         PJOtuyy26pCzHo473+FtLsLenI0Z9KjmYCaAABtg1B5gO9Sm1mthY+ohjhuGWBq5hbmT
         Xq7g==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUSzzlOrBWM6GrCCWtTBlYXewVX1in6VxNkrVC3H/iGlUlerwTW
	4b+QgwkK28iIWJJMwYdFjik=
X-Google-Smtp-Source: APXvYqy/pcNcwfgpX0HnpbwrB38/dwvE0ZGNOjZsPhJikOD2iCE6iKEOHKlBYmg0Bueuw10HFf5guA==
X-Received: by 2002:a17:907:2132:: with SMTP id qo18mr32979576ejb.247.1571140199773;
        Tue, 15 Oct 2019 04:49:59 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:907:11c8:: with SMTP id va8ls4599559ejb.15.gmail; Tue,
 15 Oct 2019 04:49:59 -0700 (PDT)
X-Received: by 2002:a17:906:948d:: with SMTP id t13mr7039034ejx.112.1571140199098;
        Tue, 15 Oct 2019 04:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571140199; cv=none;
        d=google.com; s=arc-20160816;
        b=L90SUxrj/QoMIgVkRVl8XXUpyjytXi7ieCXoKnglCoP5pQOHABb3FA4AVI9wKBYlZX
         +/AHwWquzBz+lu7FAv0RwdpMjb4nBAIYTQ6YVZScbjgo7aTEgm7mYqq70qPEZT15Kewk
         JOPcRz9kY1bHXjldN5dlAhqFL01Z73LshsM7jgXB3KYov6nJ+oXTJX4iapJe77BsROK0
         60ypIguJLLYQ+rTmK99V5p6hrD9ARZax3ihBIiHRTu31d0GDOTWV91jtg1u7M4qbjeQj
         VdEQskMlWhgTpFxIkKPx4EiJ1eHTrmDg9z/ls1XfxktR8x5I4Yl06yH2QGl8eieTZzHJ
         4jEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=V42VMWpEFYi4sSZFTzSNLqYI5nPoopC66IW0QkOa9M8=;
        b=UP8Vc/sWhJSZZuGFKb7QTdGxIedoj4S4K2A9O5Xpy8UVgLkfWQEGpdBK7JycIRXGWf
         qW98UqJy+xZf04PG9LX+WUhQolk1xkqaFMm0YEhQLbV/6C9iWFJfMstoKsb7BOEN8Gtx
         +AjAWFari0LOc04fKO0rx0pFr1NRYyWnj2GR4IWdN44YgZJ9zF7D2yHZaH8+VHrstrLr
         4zTa8hj5sZSR2YnaoO2avSNo99J/H/f+TSnODnaAFnJVWC1BG1YA/eonTwVjQQhPNinO
         A9LlpwsmcE+X0r02mLfK75UfhlTTKV3zR8tH7gDtOBc3D8gnfap2GjtC1rSNgxoopOf/
         BKJg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from thoth.sbs.de (thoth.sbs.de. [192.35.17.2])
        by gmr-mx.google.com with ESMTPS id a15si571538ejj.0.2019.10.15.04.49.59
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 04:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.2 as permitted sender) client-ip=192.35.17.2;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x9FBnwYW003364
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 15 Oct 2019 13:49:58 +0200
Received: from [139.25.68.37] ([139.25.68.37])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x9FBnvbT005648;
	Tue, 15 Oct 2019 13:49:57 +0200
Subject: Re: [PATCH 2/3] configs: Add SMC SiP IDs needed for Petalinux.
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>
Cc: jailhouse-dev@googlegroups.com
References: <C4A932C2-5761-4E9D-A455-988C33A9F8F3@gmx.de>
 <9e1fd041-8152-9c4d-c8e4-2914a1adab1c@siemens.com>
 <A5DDA02F-7F4C-48F3-B28C-C31009AE8297@gmx.de>
 <8a18a3e7-7cde-020a-d40b-ddf0f5d07449@web.de>
 <1D8490BB-5C2F-49C5-82FD-9623433A2DEC@gmx.de>
 <f47b63d3-5ccd-d993-3670-b41bd9b722cb@siemens.com>
 <ABFD6D83-9D51-4C56-9EAF-979D6CA0823E@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <55d82914-d37d-0ee0-fded-d26bb1fbe9a0@siemens.com>
Date: Tue, 15 Oct 2019 13:49:57 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <ABFD6D83-9D51-4C56-9EAF-979D6CA0823E@gmx.de>
Content-Type: text/plain; charset="UTF-8"
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

On 15.10.19 13:00, Oliver Schwartz wrote:
>> On 15 Oct 2019, at 12:35, Jan Kiszka <jan.kiszka@siemens.com> wrote:
>>
>> On 15.10.19 11:46, Oliver Schwartz wrote:
>>>
>>>
>>>> On 12 Oct 2019, at 11:41, Jan Kiszka <jan.kiszka@web.de> wrote:
>>>>
>>>> On 11.10.19 20:23, Oliver Schwartz wrote:
>>>>>
>>>>>
>>>>>> Am 11.10.2019 um 16:31 schrieb Jan Kiszka <jan.kiszka@siemens.com>:
>>>>>>
>>>>>> On 11.10.19 15:30, Oliver Schwartz wrote:
>>>>>>> This patch adds the SMC SiP IDs that are used by Petalinux to the r=
oot cell
>>>>>>> of zynqmp-zcu102.c. The SiP calls are:
>>>>>>> 0x0f: PM_SET_REQUIREMENT
>>>>>>> 0x24: PM_CLOCK_ENABLE
>>>>>>> 0x25: PM_CLOCK_DISABLE
>>>>>>
>>>>>> I suspect that this punches pretty large holes into the isolation. D=
on't we rather need filtering on /which/ clocks a guest is allowed to contr=
ol? Rather than allowing to power /all/ clocks or none?
>>>>>
>>>>> Maybe. I haven=E2=80=99t bothered yet, because in my case it=E2=80=99=
s only the root cell that is allowed to issue SMC calls. I agree that secur=
ity-wise it=E2=80=99s more desirable to also filter by clock IDs. On the ot=
her hand it makes the configuration considerably more difficult, because yo=
u need to synchronize devices in DTS and jailhouse configuration.
>>>>>
>>>>> So you=E2=80=99d make both the call ID and the clock ID a configurati=
on parameter?
>>>>
>>>> We possibly need two things here:
>>>>
>>>> 1. ZynqMP-specific filtering of PM_CLOCK_* firmware calls on clock-lev=
el
>>>> 2. ZynqMP-specific forwarding or emulation of PM_SET_REQUIREMENT
>>>>  firmware call
>>>
>>> I=E2=80=99m not sure what part of PM_SET_REQUIREMENT can / should be em=
ulated. Do you have something specific in mind?
>>
>> I have no idea yet what that thing does.
>=20
> I=E2=80=99m probably as clueless as you are=E2=80=A6 I just know that thi=
s method is being called by Petalinux.
>=20
>> Do you have a reference to some
>> API documentation?
>=20
> See below.
>=20
>>>
>>>> There is no point in generic per-ID SMC call filtering. We will likely
>>>> only be able to moderate few of those calls with a binary filter. As i=
n
>>>> case of the clock calls, we will have to take their parameters into
>>>> account, i.e. interpret them. You pointed out the Xen approach for thi=
s
>>>> SoC, and that is pointing out what is needed. If not more.
>>>
>>> For what it=E2=80=99s worth, the current Xen implementation doesn=E2=80=
=99t do any parameter inspection - it may intend to do so in the future, bu=
t currently all filtering is reduced to checking for the hardware domain (w=
hich is Dom0, the root cell in Xen speak). As a result, Dom0 is allowed to =
do most SMC calls for any device, whereas all other virtual machines can=E2=
=80=99t do SMC calls - see the implementation of domain_has_node_access() a=
nd domain_has_reset_access() in [1].
>>
>> Ugh, missed that in all those switch-cases.
>>
>> Well, same question then: Where is this interface documented?
>=20
> These are the best references I=E2=80=99ve found (from Xen xilinx-zynqmp-=
eemi.c):
>=20
> EEMI firmware API:
> https://www.xilinx.com/support/documentation/user_guides/ug1200-eemi-api.=
pdf
>=20

Looks like we "just" need to filter for permitted clock IDs, i.e. we
need a list of assigned clocks to a cell.

> IPI firmware API:
> https://github.com/ARM-software/arm-trusted-firmware/blob/master/plat/xil=
inx/zynqmp/ipi_mailbox_service/ipi_mailbox_svc.h
>=20
> It doesn=E2=80=99t shed much light on the set_requirement call, though, a=
s the parameters are =E2=80=9Cslave specific=E2=80=9D.
>=20
> In Petalinux, it=E2=80=99s called whenever a device is powered on or off:
> https://github.com/Xilinx/linux-xlnx/blob/master/drivers/soc/xilinx/zynqm=
p_pm_domains.c=20

We could try to stub the call for now, doing nothing internally. That
will only work, though, if things are already powered when enabling
Jailhouse.

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
jailhouse-dev/55d82914-d37d-0ee0-fded-d26bb1fbe9a0%40siemens.com.
