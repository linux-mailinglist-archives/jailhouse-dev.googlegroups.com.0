Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBZFKXX3AKGQED4XY7KA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23f.google.com (mail-lj1-x23f.google.com [IPv6:2a00:1450:4864:20::23f])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C9251E5744
	for <lists+jailhouse-dev@lfdr.de>; Thu, 28 May 2020 08:08:37 +0200 (CEST)
Received: by mail-lj1-x23f.google.com with SMTP id h16sf386395lja.11
        for <lists+jailhouse-dev@lfdr.de>; Wed, 27 May 2020 23:08:37 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1590646116; cv=pass;
        d=google.com; s=arc-20160816;
        b=h92AKNnSWXFqaLg2wdG01SbmJwssgbRU4r4Mi3ZVmjqU4+ieoMt1uA+vYeMedWMjXA
         HpvvOKBqt4L2dDrwO+uHZd5bzIHRdOhWNvzdTWNtEc/N1H/Auq+u7l8Z2DEXMhBogJlY
         bcjuMoTMIyMCVEkkhGIJnM84rb2wyzne93brIe6Nn9BrDxmLNwkb0IirwHxADOQbO96K
         xV36ZGCwlrnz8mGX3K+YlJkLq9T8mVGbwq303kTN+Xd4bLOAnXBctJ6tHm5ANI3FxIL+
         wqVB9ghUVjKBGewG/TIAYee6S67ba3VcYdwGKhoaNhaz2nobZ5UPHMbT63+A9bYnSVUj
         mBvw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=GwDLHd5wnhWaquQrk1cZ4andmXT4+ewJD9hGnuf+6ig=;
        b=f4Mjkp2idGLZbEouMlf40gD9j5RehlGMtSMTTlMgSy2fELbMlbGxdn86sdSYLXVU9H
         hc3pkDGYxj9gDyzgfMtl2PQUOLqSMZiK2B0f8gfQmavubAfxCl6MpeKaIP6TMrhHF5Bl
         SKId2f4rjos3hjpT687KkPKRnBGG05vTb1kEkmiD1pU5SipGBocWNK8+akiU5GVOR9ZA
         Jb3fdNHBlHPz8pilCM8idM0/xDyaR+SsyIxQdDtKOpwOejTjHvhwS2MLB41FGcmsBEKu
         gWl4Q3gdJdKzk+SRzylM/sR/rYM5bl99pXs6cBXIquuS6ndLCMraWa6WDw7uCkdqKEXE
         ws1A==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GwDLHd5wnhWaquQrk1cZ4andmXT4+ewJD9hGnuf+6ig=;
        b=sjW0Ee6IXQD41oskO4LsLkLPFHMXm8ocRSia8tsjIj2S+xRcX2nuOc6Pu2M2ZvQsTa
         bWADVUYl5kuIN/1iTUfr663Cj3Rs1jx1eopsDuR/yHT5ZzIJX49ABE5WbFHl5rMWcm7p
         9cPTRmRbcaGbxfKVYjRmHs9+paclNG6UwcJm8z0x3hf84nhWaEb4tzVXqE9RqsSIdwwv
         MmG3Jvpg2/AM72yjjD9b5zlWDpsMNdce5tJvj0ReGFe6G4SG7rBBD3/HOJfWNHoJCSOr
         /TH56PYnAzWLeseq6Zm99DpmbjMzsnfmzJqJTxQ405OEWk92AznHAJGAEN/k2J8PzA+R
         K37w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GwDLHd5wnhWaquQrk1cZ4andmXT4+ewJD9hGnuf+6ig=;
        b=XsyJmx3pBWdihFAj5yzAcbsRfI0NN99k2j936SKQjCtJ3DyFFDXRbLc5IRSgNNP1I1
         +cYicCKY1zVIYDBq8yC6N0ORHH0kIgb3OczUNVrn1EpnGMOzBRv3yYKaJh1Z7jdqAvc/
         zFy/RJH0Vnw2PXngxmnZg4MJdiZFEmwCrj8ylcY1ZDO2OlmgV0AuqUr8u0eLKObc+FMq
         wfi18MpkJiPpPFtvOK9swSCbrNdvzn+XALZmfC3t7iniIJwdr5N0gj/gy9YSzPyMR1+c
         Ubt+jkTyC2CBWdlR0DU3BcLmMHjHEbuYeNbLFAMx4KNKpGfhZEy5MhrKqYEgD1Jr1BX4
         VzFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533OZ2SYAEIsUdTwdvaGhhmFYdSJIGAp1LheGppxAX3IJUsfwm5e
	q30RfOeNfMk477LtyR0KYsE=
X-Google-Smtp-Source: ABdhPJyduvPsz3cYhjxmvomGXSVu/bNn4VdThG7JaJ3Tfk9aFM5slGSDLTGXCfDt029x7z184A0kvw==
X-Received: by 2002:a2e:9608:: with SMTP id v8mr600858ljh.420.1590646116503;
        Wed, 27 May 2020 23:08:36 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:9791:: with SMTP id y17ls250558lji.8.gmail; Wed, 27 May
 2020 23:08:35 -0700 (PDT)
X-Received: by 2002:a2e:b5a2:: with SMTP id f2mr675866ljn.261.1590646115608;
        Wed, 27 May 2020 23:08:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1590646115; cv=none;
        d=google.com; s=arc-20160816;
        b=dcC2RUXHPh1nheSJUeAfvVyvR6UFnTBZCpEbdCwtBkMBAch2McpNaMyD5Rkr3kSt1S
         T8E5hphf24WPl3j9h7I6TtYRRKsGijZWzCkdcRx2yV2o0T3rgsn2Kdl2VvVPibZUaRKE
         T3yTcPzMknxBXbqnrh3yuepgOiFz2oLemT6tZtEbYw0vJ/HTBJx6XrXLERmyoAy+hgy0
         K7wP2x1w2zXJYw5ZlWGiMHMcbI/c51P6tpWdiWR6z07denQYxRlVd6Nir0vN3DYtLqkJ
         D1JBdxZZ6i8RhHB7VCPSCgqG7941I+0N+3RSkGb/l/d8dC2OrooR8alLZn7+j5uBbucQ
         9xcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=lFraRQ6TAsXVl+xMBDt0MgGKOMPGNEQ68fooYnYgVfs=;
        b=XG5BsWpvzXm0MjT0V1SIpg7f/GVGV41/byRjDe6OlwQS9Na6nbchjKB71yyAuNbqd3
         /AcSOrTT3fZMhdDK2QLWySAUepuqYunfeCRwpuVtU7KtXzyIrf46R7afsQTWLBP2vT39
         eUpOh1/gHS84Fc9tcZcYV1e+eoN3LkVq9S4sWgLpfw2Jg2t/5qRHcmSDYN6eJNBd1w99
         Od9ST/EkEj24rXuXWC67B9khMTy7opR92KxgiZf64/0wbyGcFJsREvI3xZLtYv956zdE
         LhHYE75lG1vWcllwouoC6STPbc1xbtgxqi4rRYnHJgp+Tkqar0npfe5PxQH1yxxPunG0
         8j+g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c10si290995ljj.4.2020.05.27.23.08.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 27 May 2020 23:08:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id 04S68YjT025255
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 May 2020 08:08:34 +0200
Received: from [167.87.135.78] ([167.87.135.78])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 04S68W8B005646;
	Thu, 28 May 2020 08:08:33 +0200
Subject: Re: [PATCH v1 4/4] tools: ivshmem-demo: Pass peer_id command line
To: Nikhil Devshatwar <nikhil.nd@ti.com>, jailhouse-dev@googlegroups.com
Cc: lokeshvutla@ti.com
References: <20200527123225.31726-1-nikhil.nd@ti.com>
 <20200527123225.31726-5-nikhil.nd@ti.com>
 <98bf4c5b-9812-d2d4-8da0-c887b44277b9@siemens.com>
 <eb224001-86c9-593d-b4ab-d0ae168fcbd8@ti.com>
 <1d841e18-8a4e-0c00-4a57-1a74bb461fe6@siemens.com>
 <c32c3837-b0d6-c48e-221a-4202923d945f@ti.com>
 <08222d8d-39d1-1514-2259-891f95f20697@siemens.com>
 <46dce81a-e841-4adf-7c81-5e6abbe8148c@ti.com>
 <e75c66bb-048e-15d3-1a74-075829c9b2d4@siemens.com>
 <5a7a1e18-93dd-6bb1-8fba-ccfd91f2c8d5@ti.com>
 <bfe4f2c4-269d-0929-9ebf-673548d2a5e8@siemens.com>
 <880c56be-a9cc-8afa-c1e7-1ecefbe99694@ti.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <b4c0ca45-9898-9fc8-b1b1-edf0c377e07c@siemens.com>
Date: Thu, 28 May 2020 08:08:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <880c56be-a9cc-8afa-c1e7-1ecefbe99694@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as
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

On 27.05.20 21:55, Nikhil Devshatwar wrote:
>=20
>=20
> On 27/05/20 8:45 pm, Jan Kiszka wrote:
>> On 27.05.20 16:55, Nikhil Devshatwar wrote:
>>>
>>>
>>> On 27/05/20 8:18 pm, Jan Kiszka wrote:
>>>> On 27.05.20 16:16, Nikhil Devshatwar wrote:
>>>>>
>>>>>
>>>>> On 27/05/20 7:38 pm, Jan Kiszka wrote:
>>>>>> On 27.05.20 15:53, Nikhil Devshatwar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 27/05/20 7:18 pm, Jan Kiszka wrote:
>>>>>>>> On 27.05.20 15:28, Nikhil Devshatwar wrote:
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> On 27/05/20 6:41 pm, Jan Kiszka wrote:
>>>>>>>>>> On 27.05.20 14:32, nikhil.nd@ti.com wrote:
>>>>>>>>>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>>>>>>>>>
>>>>>>>>>>> Number of peers available on a platform is different.
>>>>>>>>>>> Do not hard code the target peer_id used for interrupt.
>>>>>>>>>>> Parse this from the command line argument.
>>>>>>>>>>>
>>>>>>>>>>> This de-couples the dependency between number of peers.
>>>>>>>>>>> ivshmem-demo can be run to communicate with desired target
>>>>>>>>>>
>>>>>>>>>> No command line, please. We can do (<ID> + 1) % <Maximum
>>>>>>>>>> Peers> as
>>>>>>>>>> target. All that is accessible via the register interface. But
>>>>>>>>>> then all
>>>>>>>>>
>>>>>>>>>
>>>>>>>>> I believe, as of now, only root cell can communicate with peer1,
>>>>>>>>> peer2,
>>>>>>>>> etc. Non root cells cannot communicate with each other.
>>>>>>>>> Please correct me if I am wrong.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Not all targets have been enabled for the "triangle" setup, but if
>>>>>>>> you
>>>>>>>> look at qemu-arm64, e.g., you can see that pattern.
>>>>>>>>
>>>>>>>>> (id + 1)% max_num_peers=C2=A0=C2=A0=C2=A0=C2=A0 logic won't work =
for a 3peer scenario
>>>>>>>>> where
>>>>>>>>> root cell app(id=3D0) wants to communicate with baremetal(id=3D2)
>>>>>>>>> e.g. qemu-arm64 has these ids.
>>>>>>>>>
>>>>>>>>
>>>>>>>> Then we need to adjust that. It doesn't matter who sends whom, jus=
t
>>>>>>>> everyone should send something and everyone should receive
>>>>>>>> something in
>>>>>>>> the end.
>>>>>>>>
>>>>>>>
>>>>>>> In QEMU, root (id =3D 0) linux-demo(id =3D 1) and baremetal(id =3D =
2)
>>>>>>>
>>>>>>> 0 should be able to to 1 and 2
>>>>>>> Here you should choose if you want to communicate with baremetal or
>>>>>>> linux-demo. There is no way this can be automatically figured out.
>>>>>>> That's why I added an argument.
>>>>>>
>>>>>> Every peer can talk to every other peer in those setups.
>>>>>
>>>>> Oh, that's new to know. Sorry about confusion.
>>>>>
>>>>>> It's just that
>>>>>> the demos are built in a way that each peer has a single notificatio=
n
>>>>>> target, by convention, not by cell configuration.
>>>>>
>>>>> But if you can pass the id and communicate with any peer, that seems
>>>>> better than the limitation that root cell can communicate with only a
>>>>> certain peer that is described by how the ids are alloted in configs.
>>>>>
>>>>
>>>> Not sure if I get the point already:
>>>
>>> In the current qemu-arm64 configuration, It is not possible for root
>>> cell to verify communication with linux-demo and baremetal-demo both.
>>> That's because "the demos are built in a way that each peer has a singl=
e
>>> notification"
>>>
>>> This is the limitation I am trying to get rid of, by passing an
>>> argument. e.g.
>>>
>>> ivshmem-demo /dev/uio0 1 #This will communicate with linux-demo
>>> ivshmem-demo /dev/uio0 2 #This will communicate with baremetal-demo
>>>
>>
>> Still not sure if we are on the page, but maybe we are thinking about
>> different scenarios.
>>
>> Is your desire to allow a full demo (interrupts seen on both ends) with
>> only two of 3 peers running?
>=20
> Yes, exactly. The 2nd peer can be either linux-demo or baremetal.
> Depending on which one it is, you will have to pass separate ID for
> sending interrupt.
>=20

OK, but then let's make this new interface optional. Max peers default
should be read from the register (rather than hard-coding it) but could
also be overwritten by command line parameter, both for the linux tool
and the bare-metal version.

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
jailhouse-dev/b4c0ca45-9898-9fc8-b1b1-edf0c377e07c%40siemens.com.
