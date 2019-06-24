Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBTXTYPUAKGQE4LAC2PA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lf1-x138.google.com (mail-lf1-x138.google.com [IPv6:2a00:1450:4864:20::138])
	by mail.lfdr.de (Postfix) with ESMTPS id 7376651899
	for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 18:26:55 +0200 (CEST)
Received: by mail-lf1-x138.google.com with SMTP id l7sf2006001lfc.4
        for <lists+jailhouse-dev@lfdr.de>; Mon, 24 Jun 2019 09:26:55 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1561393615; cv=pass;
        d=google.com; s=arc-20160816;
        b=nWLmryOgM5SKb73Y8WG6S9skHdIUi/y4wJAP6P7Z0WoiYtZQ8T17B1YMU53426sXBH
         oYODnA60mN/v0ENnGoZO96h5isU+SOM2rf12a/V/HA1vMM6uVgrf55ECROBbhSJkmaqV
         5T5CY6QAigi7HT0Dlhn0aMDLHGfj3Z6Mnr3YMURj57H/J76wxZWx2uyh3e06XhIc2AKQ
         dy+JwHKlfPkPGi9OcRJ+nLQc1mucXCcCY5Rnj8crxkhCbknFLbulEznz7eQcMwuDJZNS
         repk6rwxgDYA1wdiIBTzc4sVi0x5YJQTm8ypYaHcqlP1y79MtTxEbHvz2wZdcfRMUrrY
         r8Wg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:cc:to:subject:sender:dkim-signature;
        bh=a5Hj2RChHcaEyjW/s+bR5dBROku0wb5EH5N296TzqlQ=;
        b=QgEwj/vUY5fMnP3LKPj3niD0wCFF7xFyvfwxQZCsBhZrLuXpHU5TznmLrJ2MJf0vgb
         7L3xJj0OG/MCI1aCmekkNSbd1vwcE2kRtV09UrvSTP+abVdIV2+gK78GIe77/cJeY3dB
         vIv8OGvvbEX0UCMLTnT6+aj7RI+csciG1Ln8dlJtd6x/vFCMN98J+B9tB6k61tYpmJz7
         l08CEDMrIPkw4VVldvhTBe1OVm7ErshZw/cRBBpu2V2xIhoBC2ar3qNcKmlae5XswGZt
         2Bn1Bp6fM2F5UhUSDukpQJ3ZEBfL6XMgFQT6paBWdghSC2B3rfazhM79pVvyTmfx5hBG
         iLqw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a5Hj2RChHcaEyjW/s+bR5dBROku0wb5EH5N296TzqlQ=;
        b=e9mJg4YBasek2ZdJF5ciHMUAnzDe2lvjx2lUdrY7DPMADA4evjRTEOfWmbN2cvDa9J
         0vlw4icMY3H7jZVcBFgzmSsVz/keS/wy4PfgVG+6JIg5lONcEgIb0yTfqHqp3YmCgke2
         kX4/a8gpG5qB16OlAnF+WdOYdvD2PWwT7nRn3ZBCqD1rhWQFhu34hU+pY79xV6aKsQLE
         kFKQ73gWubKjkph2mxwbS3pXvrWBOMh3BLup25ZLuqez/NLwLwv9vV79fk0azyz7Ou15
         18v0ecltCbcp3miiVCqhkIbUuE8hEE9qpaRvy68YCOuOW039SsaUP1ID0Dve8BzlfQvo
         jM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=a5Hj2RChHcaEyjW/s+bR5dBROku0wb5EH5N296TzqlQ=;
        b=F6tMndOOd0fQD6E9X1d0FxhhRxdXmt4nWRpZqVPvXXLwkrJn6ILcCmyVbJ5CbMFr3Z
         ruusJskVORWsS5cm2Zb+If2V9UY98zCZeiVb5z67ar6UlDW0Q0aNohRnY1EZnuXZOFcK
         BUKZGc7278FU7O5U8lAX+8ZBOtAvYvmnkgWAO6UJWs8/ajezUhzZWOgf9vTC8CpMwLk9
         Vjlz5LbjG+EEU8bk10OFFuMTfQH564w4HG/bEk16ExKs9A6aMTeVp2UdM645baFX+/Ua
         6wHFZtuDGDAJeFhMoZE+oZ1UgFcQ+co2ONvHRUjqdUE1/VF+ln/qYFQbUi2vrgRqvWJo
         BbsQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAWAobY0AwxAVKuI4BPX6SI9/jwCG0xTj/+dcVJL8ayyMf93/Mwh
	vvjEHZ/8+JinPRMYV8Z5bTg=
X-Google-Smtp-Source: APXvYqxeooWQKngTUwGrh76g82euetrUTHPlX5YfYjhQnirqdhm+UrBX2W7jLi/HPrJhgfTUHvdxsg==
X-Received: by 2002:a2e:9858:: with SMTP id e24mr18966907ljj.91.1561393614955;
        Mon, 24 Jun 2019 09:26:54 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:2b43:: with SMTP id q64ls1890292lje.10.gmail; Mon, 24
 Jun 2019 09:26:54 -0700 (PDT)
X-Received: by 2002:a2e:2b01:: with SMTP id q1mr65035814lje.27.1561393614131;
        Mon, 24 Jun 2019 09:26:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561393614; cv=none;
        d=google.com; s=arc-20160816;
        b=Yf7fUsAwz2zrJb6x5Y2Xn2eHS25Ps5pp7qJL5DjQ5YzvgBLMe5j+FAkLWoomaqOWSc
         c5F/mKNPOJrzLQHZFIPAwE+Fb1P4m+92Wi2fSe5XEJrmueRrApXJ6I96YHpjT8NKl8S7
         orEexp9wPdNGMP5dM5azYbducTV0mE2sIlBFmF5ejmV0SaG9ltZpxZc3yFAze4nDr49N
         l7HzWPN0Mkgl2VbCgxYBxf6aheJnplX4FG8F0h5hxmBkx7KcnCuAqbqFTAVjQULV3KKi
         dnYWCiVXBRMSPpgQJotf4TlW387FfhmISRX95MqiMQ9W34TWVoJCoRDEYS9CMZ001M+r
         qvOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=njhUvsfY8qlURmew6ta4eaCcgt+cQ+luFaLqsy+xmWc=;
        b=EXLNlNAZzKl3nLJ5Jwfxe3U273aDAUXkVJfj544FcF04vKtkU8l4mWpW6rvQfUJYAk
         5M3VgL0OYIOf7M59eZwTPGcKlC3j0n5fgA3HwYgTyV5k2Jwq+eDL6UIzqK/Fjx44UWH5
         GXWX/T+qhDB/8BDPJqfS2LbeemAkt6og8l1f57aF3Bp9kJfjMjQpgMTP+X6hQkua48CH
         JGcRRyRTrCyVISNNarLZtwE2iB9Yg5XZR11WSyqgPgVmTd3xkQs3UUol8bvxPGHwZCls
         Cle7Bm//2xqQyzyxFtYogtKTzoR6xUxURSLqqKl1yp+N7hs2KkOYuqhmIUOSGUkeTFoq
         nKiw==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id h2si663688ljk.1.2019.06.24.09.26.53
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 24 Jun 2019 09:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id x5OGQrBN021144
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Jun 2019 18:26:53 +0200
Received: from [139.22.39.148] ([139.22.39.148])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x5OGQqsO005389;
	Mon, 24 Jun 2019 18:26:52 +0200
Subject: Re: [PATCH 0/3] x86: Fix stalled IRQs after handover
To: Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>,
        jailhouse-dev@googlegroups.com
Cc: Andrej Utz <andrej.utz@st.oth-regensburg.de>,
        Mario Mintel <mario.mintel@st.oth-regensburg.de>
References: <cover.1561357723.git.jan.kiszka@siemens.com>
 <1c8de33e-8ec3-9e4f-5a4e-d70ad133362a@oth-regensburg.de>
 <49b44cac-9657-f4b1-745c-bda91a515b26@siemens.com>
 <8d9a8525-c8f7-ca0d-9401-9c264e896866@oth-regensburg.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a07ec54a-b3b0-6e21-edf7-7917f92b9eae@siemens.com>
Date: Mon, 24 Jun 2019 18:26:50 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
 Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
In-Reply-To: <8d9a8525-c8f7-ca0d-9401-9c264e896866@oth-regensburg.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as
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

On 24.06.19 17:04, Ralf Ramsauer wrote:
> On 6/24/19 4:08 PM, Jan Kiszka wrote:
>> On 24.06.19 15:57, Ralf Ramsauer wrote:
>>> Hi Jan,
>>>
>>> On 6/24/19 8:28 AM, Jan Kiszka wrote:
>>>> This series comes out of pre-release testing: With new kernel versions=
,
>>>> we spuriously injected masked MSI vectors that are not acked by Linux,
>>>> thus caused interrupt stalling.
>>>>
>>>> Jan
>>>>
>>>> Jan Kiszka (3):
>>>>  =C2=A0=C2=A0 core, tools: Add msi_maskable flag to jailhouse_pci_devi=
ce
>>>>  =C2=A0=C2=A0 x86: pci: Do not inject masked MSI vectors on handover
>>>>  =C2=A0=C2=A0 core: Rename arch_pci_suppress_msi to arch_pci_set_suppr=
ess_msi
>>>
>>> FYI: tested this on our AMD machine. Sometimes, we still loose the
>>> ethernet device on jailhouse enable; especially, when jailhouse is
>>> enabled over ethernet via ssh. It's a rtl8169, supports MSI-X.
>>>
>>>  =C2=A0From my gut feeling I would say that this series, together with
>>> 9c633193fd583e lowers the chance of loosing the device when enabling,
>>> still, the symptoms didn't fully disappear.
>>
>> Recent changes in next may require regenerating the config in order to
>> get the desired fix. Did you do this as well?
>=20
> Of course - not. But doesn't make a difference, the only device with
> msi_maskable =3D 1 is a secondary RS232 card...
>=20

Too bad. We need to improve our bug reusability...

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
jailhouse-dev/a07ec54a-b3b0-6e21-edf7-7917f92b9eae%40siemens.com.
For more options, visit https://groups.google.com/d/optout.
