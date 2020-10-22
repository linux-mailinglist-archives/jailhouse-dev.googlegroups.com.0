Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQVOYT6AKGQEHVTDPPI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ej1-x637.google.com (mail-ej1-x637.google.com [IPv6:2a00:1450:4864:20::637])
	by mail.lfdr.de (Postfix) with ESMTPS id 961AC2957DC
	for <lists+jailhouse-dev@lfdr.de>; Thu, 22 Oct 2020 07:23:15 +0200 (CEST)
Received: by mail-ej1-x637.google.com with SMTP id c20sf189622ejs.12
        for <lists+jailhouse-dev@lfdr.de>; Wed, 21 Oct 2020 22:23:15 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1603344195; cv=pass;
        d=google.com; s=arc-20160816;
        b=NLQMnPEOWGttUNiGPJsTC9F5GNjWE7ZVIHFD7zkYTWk3HrbuWH9qGRb4TZ/Osrpccc
         hw5mPkZhNUylUfj1dJDDwKYUouJv+lhjlWi+JeybM6xVKf9cC46zetlUleL8i95B91jN
         TQijlYtSEOd/9jAUlp0Ok5X95mtBxtpbJbBf9Kkv5X5tSCcpM8B3MJPYRHC9e4BS3RY+
         T7QNKWtRYlRRgJI8zyWbJ3NzhT83XLZxZgdlGFsfDlw/AOvAH+W+4JrF6zU8a4bJQMGf
         Gj1XK00o1xR3AKdgh5x7XE9S0Sy0V89SbI7XZiA47z8Yibi6ZAxDsaKztmf3WZC9obY8
         D2nA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=vLtgCd8fOLKrZvmXDKD1k+7eptObzORRfKMb9tPoRwc=;
        b=fiZrJ/L8DAurLPZFb6CPkhsC9qRsKn2S/d2Mem5bLWgR4pJca3I2FKq+wQ22p2M4Mw
         mp5hbHVeAk9MMSvfxZhPBbiCELJsgLZ/1N9xBKmK4GHdu076HnydKuEVyv29KV9JFj95
         MHNMBlEe7BkZlLZHMkKxk4mN/o3ciZenH6U7pOC65rMwHF9aafq2CLAN3ZGtOb6VJgI6
         v4oezCoHMMivN3KhhLKUCWUz2NGDzXGJvQK/CkKRdx8RVPGF6ihS5Ei4V53QrLoyRmvy
         wWbEESkRpamJnMPRMTN/EnLPUrRBxanZNj6UwbzrnViLP0Qgz0yTyGFlv5A/8YfDxANd
         knEg==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vLtgCd8fOLKrZvmXDKD1k+7eptObzORRfKMb9tPoRwc=;
        b=eeR1iFfxLvXXo5IbPVIq4tT0vEcPlvuxFqDF2JyjiObdWqFHWdXPEX3nsoi2Xilkra
         sC9/Lzf/jP48gp8Z50otA8gndlTBrVVLNsyfnMrfFN/7XYhLp8G0mRt7Fa/2IIkLQcCm
         4rfF9XBfBOoxggDwYm5lm2J+UKzZVK//C0WREC5uofxlXZIVzAERw0TSnwu8S9/VbMUG
         SIkGFAyfsne4PJrRVNPrabZJTuKahME12XZD/CvwEb5TJ+ZKhesI57o6bDa0Yjlro7VT
         YcGwpH3YVXdXVCOvtBmc2HyHIzbKxftiyuKx/UFhBMifLumgtGsqckAa0iRSsitJFAKE
         Yv7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=vLtgCd8fOLKrZvmXDKD1k+7eptObzORRfKMb9tPoRwc=;
        b=K6gS4I7JPFRSFxyb6FohdLLQXkl0pTCY+A1rw//Rms+NE5yGK0CMQ3AjKY9m0VKGyH
         CaXhs6I8ixemBjKGbZNDpmml2MG8Rza/K7Kk9YmEqT9b8EqrWbpbp8sodjbG7KkAk6S5
         R1cF0RfgcEv87p0rmkBJoMz6q/40441Hki5pxujRyYdfII4QU4FrRP/IDcTbjEDYZf0H
         rbp3bpmfegi8syBCR8emCMkl73lNaB1/75YoM+3xvm8DHoHVWXqhI6mTlAPj35PgYB0M
         BiDCyvaz6dMulMoabkivQTX+UYVTAmSaLayP+FH31OHdETcGusxCMksIj0LZZnd7YIAq
         L7LQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531g13K4DtZ3TPtH44HbIYEQZ6II1dzdpt8AcN9/b1YjY9efXpUE
	GC0XGoaulbTDF8z9BoLu7QE=
X-Google-Smtp-Source: ABdhPJzZVrOl/CyKB7r3CBi23oMrwvMyYqA87pks31ujWxPLgls+LYhHNgH0RzVNoccRfHRVfYNkBg==
X-Received: by 2002:a05:6402:142a:: with SMTP id c10mr713021edx.261.1603344195246;
        Wed, 21 Oct 2020 22:23:15 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:aa7:c04e:: with SMTP id k14ls671311edo.1.gmail; Wed, 21 Oct
 2020 22:23:14 -0700 (PDT)
X-Received: by 2002:a05:6402:176c:: with SMTP id da12mr726951edb.28.1603344193986;
        Wed, 21 Oct 2020 22:23:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1603344193; cv=none;
        d=google.com; s=arc-20160816;
        b=mBdbz677K6iauTJdikTNm5kDHHynywJ+hCYLagPKp//rP6PcJnUpxLlp3XLH5cNbAA
         xL5JUtlifWD1SSg5m+ZJ/+HMot88CWLbGKpJpuxrt5Bx6pI7VIkWxLJyp2fsjdbExc2s
         ViDdI3Q2Iaa/wPiBjCdbPAIs6cRf4lOTlBjhIxjZaUharBAaHXsp+0D4wB81goi5agKZ
         lNoHUpgxS5k0IBjtSqu/geQ4J0z1zVxxx9Zj+W1krm37EW3vP3uAJ6nb9wckeu/ivEmE
         v2y9Uh6Fp/u88ADwExhE0GAqy6oH4fHwF3uVLDvpiUpIPtJRTaSO8eIjJP/U1WSB3/PL
         zCug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=qP7SbZNE7Y+bpJT97NKVZAK/KKgdnyErwcgoh0RiC/8=;
        b=zrmSisaYLZuSKDtHciaYWJmH06Hcst0vjh68RKtYtyZ9Rq9ehPxnOOMrde3YscNYkW
         IT4ih4e7D1DjmmBgZfRYDsNsga5t+YV2AwSeJgsoC7MbZ4PsGqC6fSnigLV9Spcd8kFu
         w6gpj1BlPeCT8zy606g7ILEh31yfRZ2CD8Gx+PWWBAit41/dq+OqOyRM+Bnu+bajxgb/
         fe8LPaoHBZuxci7Z5UrhnjNc1d1vQVmmVWquYLfygmmdGuGZsVU3tShGS56+KbHya11a
         mGTD9aykrTqtDTTHOcInBfP14vBvP2G7reuHE7xSouJMDyesM7tJ+7EB9Mlzj/W7cKiX
         sulg==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from david.siemens.de (david.siemens.de. [192.35.17.14])
        by gmr-mx.google.com with ESMTPS id u2si17894edp.5.2020.10.21.22.23.13
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 21 Oct 2020 22:23:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as permitted sender) client-ip=192.35.17.14;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 09M5NDaL013952
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Oct 2020 07:23:13 +0200
Received: from [167.87.53.106] ([167.87.53.106])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id 09M5NCK1027044;
	Thu, 22 Oct 2020 07:23:13 +0200
Subject: Re: [PATCH 01/26] hypervisor: add extra warning flags
To: Andrea Bastoni <andrea.bastoni@tum.de>, jailhouse-dev@googlegroups.com
References: <20201021145404.100463-1-andrea.bastoni@tum.de>
 <20201021145404.100463-2-andrea.bastoni@tum.de>
 <3ed6ecf9-900c-6dc5-9a16-900bfeef891b@siemens.com>
 <07653995-e5e1-3857-099a-a45fd0194b13@siemens.com>
 <fd0aecbc-2650-7df2-f113-eae7ec85da7e@tum.de>
 <d794898e-1827-e436-e498-de18d620981a@tum.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <31f34647-af8b-612d-2473-2bb0982bd335@siemens.com>
Date: Thu, 22 Oct 2020 07:23:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d794898e-1827-e436-e498-de18d620981a@tum.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Original-Sender: jan.kiszka@siemens.com
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.14 as
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

On 21.10.20 21:53, Andrea Bastoni wrote:
> On 21/10/2020 21:26, Andrea Bastoni wrote:
>> On 21/10/2020 20:44, Jan Kiszka wrote:
>>> On 21.10.20 20:43, Jan Kiszka wrote:
>>>> On 21.10.20 16:53, Andrea Bastoni wrote:
>>>>> Signed-off-by: Andrea Bastoni <andrea.bastoni@tum.de>
>>>>> ---
>>>>>  =C2=A0 hypervisor/Makefile | 4 ++++
>>>>>  =C2=A0 1 file changed, 4 insertions(+)
>>>>>
>>>>> diff --git a/hypervisor/Makefile b/hypervisor/Makefile
>>>>> index 5322b5aa..41bf99f3 100644
>>>>> --- a/hypervisor/Makefile
>>>>> +++ b/hypervisor/Makefile
>>>>> @@ -31,6 +31,10 @@ KBUILD_CFLAGS :=3D -g -Os -Werror -Wall -Wstrict-p=
rototypes
>>>>> -Wtype-limits \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fno-st=
rict-aliasing -fno-pic -fno-common \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -fno-st=
ack-protector -fno-builtin-ffsl \
>>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -D__LIN=
UX_COMPILER_TYPES_H
>>>>> +# Nice to have: -Wcast-qual -Wpointer-arith
>>>>
>>>> Shouldn't got here as comment.
>>>>
>>>>> +KBUILD_CFLAGS +=3D -Wextra -Wundef \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wnested-externs -W=
shadow -Wredundant-decls \
>>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 -Wdeprecated
>>>>
>>>> Should be merged into the assignment above, no need for splitting it u=
p.
>>>>
>>>> However, this must come last as we have -Werror, and you are now break=
ing the
>>>> build.
>>
>> Yes. I thought too late that the order should be reverted for next.
>>
>>>>
>>>
>>> It could also come in pieces
>>>
>>>  =C2=A01. fix nested-externs
>>>  =C2=A02. enable related warning
>>>  =C2=A03. fix shadow
>>>  =C2=A04. enable related warning
>>>  =C2=A0...
>>
>> Yes. But Werror should be added last then.
>=20
> I mean, it is a bit strange fixing a warning without "seeing" it, but yes=
, it
> can be done.
>=20

Just check the man page: We can do -Wnested-externs=20
-Wno-error=3Dnested-externs... then fix warning, and then remove the=20
no-error again.

Jan

--=20
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/31f34647-af8b-612d-2473-2bb0982bd335%40siemens.com.
