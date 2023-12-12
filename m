Return-Path: <jailhouse-dev+bncBCJZVRG45MBRBCNI4CVQMGQEDABMD4A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x13c.google.com (mail-lf1-x13c.google.com [IPv6:2a00:1450:4864:20::13c])
	by mail.lfdr.de (Postfix) with ESMTPS id EF6BA80E566
	for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Dec 2023 09:04:27 +0100 (CET)
Received: by mail-lf1-x13c.google.com with SMTP id 2adb3069b0e04-50c09f979b5sf4209840e87.3
        for <lists+jailhouse-dev@lfdr.de>; Tue, 12 Dec 2023 00:04:27 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1702368267; cv=pass;
        d=google.com; s=arc-20160816;
        b=cbJqMPP6IPJPlMRYOzeJzprR42O2ApVsNYNWlwXPOe+DPKuwOM9/zMPq0sFNGwIEL8
         bfJ0rXCopDhd3gCzfav3xLM0XcW+ZK6+hcgHZmwNu28wq1MlcSSrNO007rfERGO7Dm3g
         gmaez/QEVja73CIXWjgwjmtZprX9IZqqhpFKKj79rs/O7Yvbbiexh0LltGkZpclBayO3
         cBPhjzi5ct/XAPrg62om/mnxEacX7F/P3qUqyCI/Flp7p4vqV8vV5Z+FdiJKR9sNfapy
         n+2XrNdU56d0asct5UQOGi+D9QgenzdFbj64f/Y4VXUT0reinE+sxmCD3nSaVxmuEsHt
         hUUg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :in-reply-to:autocrypt:from:references:to:content-language:subject
         :user-agent:mime-version:date:message-id:sender:dkim-signature;
        bh=4XrNp4n8uDCcC1zeShRH8fnCAsHFW7+8Zaj+9kAOqhk=;
        fh=eWhekAss/tV9whNhPMf4oo/SViGOEhgWyzNVhUXhQqw=;
        b=VDTWnFp1V0zb2Q/ik+jcvNjlVIeHzjzatkWZTaHZ8LzujUvTwpERVm3fWN183wSrME
         mvjMFbdCh9+QfNVX/iQaNI9GIxfSulnNbahvC9iUJc3D8CCQfFqrdGhrwl9f1RDCt30e
         qLXAaYJugVbEnMc0jg6h/uwJroBE9vdPjVUGFBBrLrfatGd1ucjapMdawEwRNSKHa7Zw
         9gB1xCx8s4Hlwi5YErGcA75S3tnfxsDbMcFQz4eVkp99a2i4VuXJjNhVloq4LBk88+w6
         J0h6dWyuQupg4C3yq+0SP69C6x6qrXXfCzH39l8rkvC/dlx42lPUty/NFbmaEoJGrGkK
         etWw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=tu-postout21 header.b=FQTMBWBe;
       spf=pass (google.com: domain of alex.zuepke@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=alex.zuepke@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1702368267; x=1702973067; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:content-transfer-encoding:in-reply-to:autocrypt
         :from:references:to:content-language:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=4XrNp4n8uDCcC1zeShRH8fnCAsHFW7+8Zaj+9kAOqhk=;
        b=NmxatZlX7WLfmaKrPonUVJtXnD0embHk3KURUFJouw8yK9KH9aoREHRACqTLOl65nV
         o+KkSavFcxzuaY6Rvogc1SalNiVwXjR1yHJvT5L6vDOih1yHsyAQPv7dowoQvte52cgL
         JD/nzKinX2N0hZAufxjqg6rQXUtQl6ashjUkK058QWjU11ad0M2PFr3tKQ+9pgxxtQH3
         q4RvM4ary7MtQxHV2/Fvlt+BsRyZLZxU7cLw9EJa0cb0eDWIImDJR7TYxSEhIIu/05T6
         p1Rn0IrUGpONf6lHrFUYpDLom33ibAeHvcwbayE9DaRhapizuyJrMyYpKj3inivWFOqB
         RvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702368267; x=1702973067;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender
         :content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4XrNp4n8uDCcC1zeShRH8fnCAsHFW7+8Zaj+9kAOqhk=;
        b=j4yzIIeMgYZMmga3RWxWy7vApzihfLdo67xn4w+K40eRfe16nZosp/+vCEfS7gxfnH
         01aRc6LcFdm7S0bxYa8CDI0TGKU/3xeGKdOOsIKRJWP8dguzfw3v2Yqr5BfzYXqnNarM
         GMYTephWU8SL8jpwkydYFcxYl+Mn7lMlfKvH2Z8YSvfN0WfwtM2JXWwU5/MPo5YirJmC
         TylXhGP12V7S+QAL/I4OAfK4Joej3ETbnVu9e1Za3/TRdldLWT/wfXOnce79TsWxETB6
         z9LtgqlY3bJJEXP7+QXDRS/kMFlT5phpymUXRf08fGEcWa2kbv9R2byQ3I9jQAQKeA5R
         xKFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YyTV9qstTC3O6/fT4YVw8M3c/RxY6TWX1jNqgv+E/4n8PFW0nCr
	lLfpewwlQmHXXBgSEX8FJBI=
X-Google-Smtp-Source: AGHT+IEHu6t0r0zLxgY6dORLMyAbj5Oo1ZTJ/gQ8doJH6lHmmPLkCFpP0MDzP1169MTu4AiMhRHhoA==
X-Received: by 2002:a19:674a:0:b0:50b:f84b:9b04 with SMTP id e10-20020a19674a000000b0050bf84b9b04mr2657794lfj.115.1702368266471;
        Tue, 12 Dec 2023 00:04:26 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3d20:b0:50a:a9bd:7eaf with SMTP id
 d32-20020a0565123d2000b0050aa9bd7eafls380136lfv.2.-pod-prod-03-eu; Tue, 12
 Dec 2023 00:04:24 -0800 (PST)
X-Received: by 2002:a05:6512:48a:b0:50b:fae2:f5d0 with SMTP id v10-20020a056512048a00b0050bfae2f5d0mr2392030lfq.41.1702368263750;
        Tue, 12 Dec 2023 00:04:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1702368263; cv=none;
        d=google.com; s=arc-20160816;
        b=IFokUT0vPbvxwd9/5shJ4wofJvAEzbfjvbW2dG5OT/jaboglFk+T65fqXxkxB9ENgC
         EQ8ISqHNQCmSqjpXiOSMa8SAHQ/INvpsmITyYd2pYssYiWmopipNSr7mWDewe2pSDstB
         57U+MzWh4iTQNzqw8KYFSCg7MCCl7sONl1u6HfPtg8RNJ3vAcjKAzEm2EqSBnu+F6g4R
         3Uygj0O5DQ/zycBE42I9L7+bGavig/q7E8uuTVdw3B0RYkjzE5tndrohC+Lrt47sMif0
         0dLYPmLEbqRbfqmBkYU7ZguBFa4XHb20Pzzitirv1U1YbF77X+Ssoku+2UdX9TbvmW8B
         meCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0WOFUZP80DdCLccG6ksV4gIqBRvpI15PmL6p53sGrcU=;
        fh=eWhekAss/tV9whNhPMf4oo/SViGOEhgWyzNVhUXhQqw=;
        b=uHnrC34ClfRORO6oQ3+1kUysQbYyAo1EtufaJI71fJP9Kdgb094n+CVLb6uJoBDHqB
         usfa4RTvRGxTvb9EcnzIIYVU0BAvv2EWVz1+SfXiRIPUkWn2H8MWBh9bqwqMM4mggAO0
         x+0dcInzTqtYTyoDcqcJu7phlfAKlayvBEqdFMff7vGUL9mgY3yRNS7HqGxePaxRMBJG
         B46cmhUWKyYc3Jgo76e/DPm5xP01mvWSckGQCkg+CwnOTedBmt/fGA2Hyj3hZPyxWKGS
         mOIHe7Ckyt7Wyc4wFN3xkfmbIwwA6vexWTJZpR1RyIej+3xUhLEVMpGzOMB0zjGT2CvS
         jCTQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@tum.de header.s=tu-postout21 header.b=FQTMBWBe;
       spf=pass (google.com: domain of alex.zuepke@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) smtp.mailfrom=alex.zuepke@tum.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=tum.de
Received: from postout2.mail.lrz.de (postout2.mail.lrz.de. [2001:4ca0:0:103::81bb:ff8a])
        by gmr-mx.google.com with ESMTPS id s20-20020a056512203400b0050bc7296c7csi358441lfs.2.2023.12.12.00.04.23
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 00:04:23 -0800 (PST)
Received-SPF: pass (google.com: domain of alex.zuepke@tum.de designates 2001:4ca0:0:103::81bb:ff8a as permitted sender) client-ip=2001:4ca0:0:103::81bb:ff8a;
Received: from lxmhs52.srv.lrz.de (localhost [127.0.0.1])
	by postout2.mail.lrz.de (Postfix) with ESMTP id 4SqB3B6sC8zyVD;
	Tue, 12 Dec 2023 09:04:22 +0100 (CET)
X-Virus-Scanned: by amavisd-new at lrz.de in lxmhs52.srv.lrz.de
X-Spam-Flag: NO
X-Spam-Score: -2.88
X-Spam-Level: 
X-Spam-Status: No, score=-2.88 tagged_above=-999 required=5
	tests=[ALL_TRUSTED=-1, BAYES_00=-1.9, DMARC_ADKIM_RELAXED=0.001,
	DMARC_ASPF_RELAXED=0.001, DMARC_POLICY_NONE=0.001,
	LRZ_CT_PLAIN_UTF8=0.001, LRZ_DMARC_FAIL=0.001,
	LRZ_DMARC_FAIL_NONE=0.001, LRZ_DMARC_POLICY=0.001,
	LRZ_DMARC_TUM_FAIL=0.001, LRZ_DMARC_TUM_REJECT=3.5,
	LRZ_DMARC_TUM_REJECT_PO=-3.5, LRZ_ENVFROM_FROM_MATCH=0.001,
	LRZ_ENVFROM_TUM_S=0.001, LRZ_FROM_ENVFROM_ALIGNED_STRICT=0.001,
	LRZ_FROM_HAS_A=0.001, LRZ_FROM_HAS_AAAA=0.001,
	LRZ_FROM_HAS_MDOM=0.001, LRZ_FROM_HAS_MX=0.001,
	LRZ_FROM_HOSTED_DOMAIN=0.001, LRZ_FROM_NAME_IN_ADDR=0.001,
	LRZ_FROM_PHRASE=0.001, LRZ_FROM_PRE_SUR=0.001,
	LRZ_FROM_PRE_SUR_PHRASE=0.001, LRZ_FROM_TUM_S=0.001,
	LRZ_HAS_CLANG=0.001, LRZ_HAS_CT=0.001, LRZ_HAS_IN_REPLY_TO=0.001,
	LRZ_HAS_MIME_VERSION=0.001, LRZ_HAS_SPF=0.001,
	LRZ_MSGID_HL8_3HL4_HL12=0.001, LRZ_MSGID_MOZ=0.001,
	LRZ_SUBJ_FW_RE=0.001, LRZ_UA_MOZ=0.001, T_SCC_BODY_TEXT_LINE=-0.01]
	autolearn=no autolearn_force=no
Received: from postout2.mail.lrz.de ([127.0.0.1])
	by lxmhs52.srv.lrz.de (lxmhs52.srv.lrz.de [127.0.0.1]) (amavisd-new, port 20024)
	with LMTP id x7eeNmcO92JF; Tue, 12 Dec 2023 09:04:22 +0100 (CET)
Received: from [IPV6:2001:a61:3a5e:df01:4e6d:9571:246d:a84] (unknown [IPv6:2001:a61:3a5e:df01:4e6d:9571:246d:a84])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by postout2.mail.lrz.de (Postfix) with ESMTPSA id 4SqB363tn7zyV6;
	Tue, 12 Dec 2023 09:04:18 +0100 (CET)
Message-ID: <70769d2b-d476-4b2c-bcae-104b27628695@tum.de>
Date: Tue, 12 Dec 2023 09:04:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
Content-Language: en-US
To: Peng Fan <peng.fan@nxp.com>,
 "jailhouse-dev@googlegroups.com" <jailhouse-dev@googlegroups.com>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Jan Kiszka <jan.kiszka@siemens.com>
References: <DU0PR04MB9417D1CFA35D02279D40EA6A888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
 <22a09591-024f-4a02-a18f-793094d81d45@tum.de>
 <DU0PR04MB9417F5A4D0C801E59F32E6F2888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
From: Alex Zuepke <alex.zuepke@tum.de>
Autocrypt: addr=alex.zuepke@tum.de; keydata=
 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
In-Reply-To: <DU0PR04MB9417F5A4D0C801E59F32E6F2888EA@DU0PR04MB9417.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: alex.zuepke@tum.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@tum.de header.s=tu-postout21 header.b=FQTMBWBe;       spf=pass
 (google.com: domain of alex.zuepke@tum.de designates 2001:4ca0:0:103::81bb:ff8a
 as permitted sender) smtp.mailfrom=alex.zuepke@tum.de;       dmarc=pass
 (p=NONE sp=NONE dis=NONE) header.from=tum.de
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

Hi Peng,

Am 12.12.23 um 08:52 schrieb Peng Fan:
> Hi Alex,
>=20
>> Subject: Re: str wzr, [x1, #16]! triggers EL2 unhandled data abort
>>
>> Hi Peng,
>>
>> Am 12.12.23 um 03:42 schrieb Peng Fan:
>>> Hi All,
>>>
>>>
>>> I am running jailhouse on i.MX9 Cortex-A55, and meet an issue.
>>> " str     wzr, [x1, #16]! " this instruction in EL0 triggers unhanlded
>>> Data abort in EL2, with ISS is data abort, ISV is 0.
>>>
>>> I am not sure why this instruction trigger DC with ISV 0.
>>> Any ideas are appreciated.
>>>
>>> Thanks,
>>> Peng.
>>
>> The Arm architecture cannot provide all information in ISS for instructi=
ons
>> that also update the base register.
>=20
> Does ARM architecture TRM note this? Would you please share me the
> Chapter?

In my old version of the Arm ARM it's noted in Section D7.2.27 "ESR_ELx,
Exception Syndrome Register (ELx)" in the description of the ISV bit:
> Instruction syndrome valid ...
> This bit is 0 for all faults reported in ESR_EL2 except the following sta=
ge 2
aborts:
> =E2=80=A2 AArch64 loads and stores ... and excluding those with writeback=
.


>> You need to change the code sequence to:
>>   str     wzr, [x1, #16]
>>   add     x1, x1, #16
>=20
> Hmm, but gcc generates "str wzr, [x1, #16]!" from c code.
>=20
> This should be common issue I think.

Yes, and I remember that there was some discussion on this on the LKML year=
s
ago. The raw accessors in Linux like __raw_writel() enforce the simple
load/store forms to aid virtualization-

Best regards
Alex


>=20
> Thanks,
> Peng.
>=20
>>
>>
>> Best regards
>> Alex

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/70769d2b-d476-4b2c-bcae-104b27628695%40tum.de.
