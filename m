Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBBQEZVDXQKGQEYUIS5WI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23b.google.com (mail-lj1-x23b.google.com [IPv6:2a00:1450:4864:20::23b])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A263114D3B
	for <lists+jailhouse-dev@lfdr.de>; Fri,  6 Dec 2019 09:09:37 +0100 (CET)
Received: by mail-lj1-x23b.google.com with SMTP id g28sf1798818lja.6
        for <lists+jailhouse-dev@lfdr.de>; Fri, 06 Dec 2019 00:09:37 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1575619777; cv=pass;
        d=google.com; s=arc-20160816;
        b=iN/a0KlgXpIX+GHc/mmym0kJmsDuVwEQN5RR0IhbvUWBpKU7gJ5WP60Zjk0la+3TCT
         1U7HXHhjIawp/Bv0UIRC6/MvxRrW7JaqPN+xO37bwdbsw1aTFoZeoAgz4kB+0/RflWnW
         BXiIZ/DkVKCuGCMPv0fYcGepSFlkye6cmHRGh9ARIhsqB8WcvsYSXWN2FvFVyyXhtctB
         EkkqqMb3c4jhuWaXAFI6JRhAArry6+sxRiX6uI9S/W+3eFHIux4AigkJev39zwggPy6Z
         ivxNe1shE9ur+vYUFSaP5zvcE6TGkW4d0JVfG6WG58CijU5VYEvjdQqD0mGkqYu0yIBq
         NoJA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=eATfPA4STzpBMOSeclrP04sP3PjUpCg7WZuUz8+ALWA=;
        b=M+Q6bhJTn3v0urNZoTpDyNYMYadGzzwYNFfPOCiLTESbU3nyosQwIvPzQIWum5pvnp
         1xLmDo/LAwp0uunBEus7I2qiOZiO60F44VUSob7Q56qis+CZzOcyx7po9JJRxyKUkxoS
         6CvagfS7PO8NB2L7Kb1JVmZ8ym8VU8LZshwi8tpoGixRw7IvbqE8zy2cQBNPm/6brNvS
         OAKOts2592Ez5PgmmLMQtXIc1Xz6zKchG7C74SlZBz3vrob37nJM9TZjxBx/VkGDoOye
         sidUzXxtRul27C9/y4Co7HmdjcIfRZGj6Pc1LyuIaKYfge/S6AEk6/4qwv2s5fNfgJE1
         yZyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eATfPA4STzpBMOSeclrP04sP3PjUpCg7WZuUz8+ALWA=;
        b=k3706I9h+3ESSklh4c7YWcwsVSYJm5mg9Ai/TYm7vBErkB2tER/mSVzyOWT2sGP8Wj
         MG69YHuVu2wjq+IBZi2Vt//I5O/0w21aHNHolHJkkyGnGK8hbsmN5ZEs4YR6zumGV5LY
         XyrOkF8OaCSZnrCi4dqvM4CU/fmmH207UP9m+P1GkTNR7h3RzKrESjh+PYBxe/AdWq2j
         EFUGqvReSv1sh64MBlt4iixJh27haIYM/1upvzCi1+qlQNSbbbw7QwEb4ejOl6LVE8lq
         LMF/UcI9Y3TtvwGzV75yERWhdtVPuu8RSSmSsjkm/qIBdj7tmVwugkm0LSqVfLlC1daF
         /14g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=eATfPA4STzpBMOSeclrP04sP3PjUpCg7WZuUz8+ALWA=;
        b=R5OIhTcfywg/2gaqnIMGexeBHRhGzGdOPSyjyJ7NrnBMB+siGCZ/u5NhE0rQI9z3xN
         EkW7+CcR3QAzDfdU65WOOnDmnpV/c/RbLNWDJJnvgmIS3WP8J0M1tnE1omXveBkkk6Ub
         glPFjix4mbbwaJoPZBX+me6hDEEq4XrqT+L0r2HxT0p0l/+dOrF1AkP0Ikh+C4KpD7HW
         upIT2MFsJpDUbvgQUtlrYKNhXMcRjvl2dlTA0gJhD3zCJosMFN35kLVrFkGeiqzkf71x
         qXHJjSjQItEbcwdFb0evwSBeJtJWn0B7E7DUx1UHyVNcfXeqkueglh0vRJ+ZOY37WLFG
         0EGQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAUlkEfJ10dkWmJ5IJoa+Cay6lGWKCQLJdu43Yn5ng9+ddUwwKkh
	YxH3jXoZ5NojaL4VvM1Uy6o=
X-Google-Smtp-Source: APXvYqwhobd+Cao/KQ3fymWeCvOeydcN4qUHXYy4LciehoGdnFj5lO87yoatDdsPUTK8QB/ydAw7Bw==
X-Received: by 2002:ac2:555c:: with SMTP id l28mr7300141lfk.52.1575619777029;
        Fri, 06 Dec 2019 00:09:37 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:864f:: with SMTP id i15ls861736ljj.11.gmail; Fri, 06 Dec
 2019 00:09:36 -0800 (PST)
X-Received: by 2002:a2e:3e11:: with SMTP id l17mr8022726lja.45.1575619776199;
        Fri, 06 Dec 2019 00:09:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1575619776; cv=none;
        d=google.com; s=arc-20160816;
        b=VfWn2ubEQqDYxL1C0gAm/5ztPR50LPDuk8nkevWarZsfXa8r6iClQZ6CqZPEX4pWW4
         O08VbpV0jL70CFygNJng50baGVFW6kSV0HAa+YTGYeOF3QTiGL7Hj/8YnQx7+GgHXv+i
         0FCrO2sLWLN6Nmiw56OmtMlkjfp8WfHwWXqxYS0lnZ18jXjy05Gui3WMCrtc6ivm1ivO
         VU5q4Bgr4frBV51zhh14HoniSPuGpWap08ahM9XjEmVRGHVeWEBjK2579x1+IFT0d2uf
         5qio0XGinOtVzkueLVPUWjAgimzZw5aVIqYGG8ow5wPbjOO1KW/gmuf87ck1gVpvCgj4
         NvtQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=ki4dlAwkFUysPosWRZlehmATS6kqJ4mfyVRbwNUhTeM=;
        b=QLlhbhuJDLTKgrDhds+1ZkWNqtGSnjmpyJFvXzdk4wTIlF91unbJlegvsQk5Hr2Ful
         lquZ0ufc/hLmRldx1cpLLzssMDdqcirfoVcennJ8VG/CkqL68qgHj06B8tYh6Y0wJ10G
         gDCu15cIsIDT1GIfs/9cSHfcnigLH3p2bB5oEjt2MV3fN9hEiva8EQQmnXfI+dHxdXL+
         9V9Lh+l81TnlFsX7dgEUU+F5Wlvu3HIomD2BGagpjuqYoyDSstIskpx7/HHOO0EtxA7X
         cI5brm1NnJ0vkfMrT/AKiWZHKb+p8E+HjtS0g3HLxFAWXRhjbxcN/fVF3GtxJI7WfFT3
         DqAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from goliath.siemens.de (goliath.siemens.de. [192.35.17.28])
        by gmr-mx.google.com with ESMTPS id 68si532579lfi.3.2019.12.06.00.09.35
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Dec 2019 00:09:36 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 192.35.17.28 as permitted sender) client-ip=192.35.17.28;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by goliath.siemens.de (8.15.2/8.15.2) with ESMTPS id xB689Yvg029875
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Dec 2019 09:09:34 +0100
Received: from [167.87.55.140] ([167.87.55.140])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id xB689YFU021378;
	Fri, 6 Dec 2019 09:09:34 +0100
Subject: Re: Zephyr as a Jailhouse inmate
To: Mani Sadhasivam <manivannanece23@gmail.com>,
        Jailhouse <jailhouse-dev@googlegroups.com>
References: <e4de0ebb-83e6-4010-8f17-7cbbdafec19f@googlegroups.com>
 <ae19eed5-afc4-ddf2-1855-4bd474790065@siemens.com>
 <CANBTL1VsEGSiqZe5SG4EQ3sn4KbcvKQqYLERCT-NbqxZK5ZBKQ@mail.gmail.com>
 <87131459-2a1d-91b5-21f5-3dfccd49fa81@siemens.com>
 <CANBTL1XSjDtz5OFuMUXSM0R_=nsESgHH1WFxRk9qaA2uCy0Jww@mail.gmail.com>
 <0660d2b8-b8e4-fcf2-69cf-068b9fc4a622@siemens.com>
 <a27fdb7b-0c85-d967-7c8c-81d26b0157b6@siemens.com>
 <CANBTL1XAj0ArLDjNq_2rfu8NXCp9h5i=atzhP8m2BCEhLtRVCg@mail.gmail.com>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <0c7b7542-5f48-8f77-128e-26eee1f24ad7@siemens.com>
Date: Fri, 6 Dec 2019 09:09:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
In-Reply-To: <CANBTL1XAj0ArLDjNq_2rfu8NXCp9h5i=atzhP8m2BCEhLtRVCg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On 05.12.19 20:32, Mani Sadhasivam wrote:
> Hi=C2=A0Jan,
>=20
> On Thu, Dec 5, 2019 at 1:38 PM Jan Kiszka <jan.kiszka@siemens.com
> <mailto:jan.kiszka@siemens.com>> wrote:
>=20
>     [re-adding the mailing list]
>=20
>     On 05.12.19 09:07, Jan Kiszka wrote:
>     > On 05.12.19 08:49, Mani Sadhasivam wrote:
>     >>
>     >>
>     >> On Thu, Dec 5, 2019 at 1:09 PM Jan Kiszka <jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>
>     >> <mailto:jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>>>
>     wrote:
>     >>
>     >>=C2=A0 =C2=A0 =C2=A0On 05.12.19 08:14, Mani Sadhasivam wrote:
>     >>=C2=A0 =C2=A0 =C2=A0> Hi Jan,
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0> On Thu, Dec 5, 2019 at 12:36 PM Jan Kiszka
>     <jan.kiszka@siemens.com <mailto:jan.kiszka@siemens.com>
>     >>=C2=A0 =C2=A0 =C2=A0<mailto:jan.kiszka@siemens.com <mailto:jan.kisz=
ka@siemens.com>>
>     >>=C2=A0 =C2=A0 =C2=A0> <mailto:jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com> <mailto:jan.kiszka@siemens.com
>     <mailto:jan.kiszka@siemens.com>>>>
>     >>=C2=A0 =C2=A0 =C2=A0wrote:
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0On 02.12.19 19:43, Manivan=
nan Sadhasivam wrote:
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Hello,
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> I can see that the Zephy=
r RTOS has been mentioned in
>     the FAQ as
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> one of the ported OS for=
 non-root cells.
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0> Is there any reference c=
ode I can look into?
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0There is x86 support for Z=
ephyr as Jailhouse "inmate".
>     Check out
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0zephyr/boards/x86/x86_jail=
house/doc/board.rst. If you
>     run into
>     >>=C2=A0 =C2=A0 =C2=A0trouble,
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0report to the communities.
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0> Ah, just noticed that it got removed some=C2=
=A0time ago:
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0
>     =C2=A0https://github.com/zephyrproject-rtos/zephyr/commit/f3611fdd0c8=
ca54a9f19bc56a14b4a2fdadaffe3#diff-bb9445fa64739ef6a5a6b59d520deb07
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>
>     >>=C2=A0 =C2=A0 =C2=A0Too bad they didn't reach out...
>     >>
>     >>=C2=A0 =C2=A0 =C2=A0> But this could be helpful!
>     >>=C2=A0 =C2=A0 =C2=A0> =C2=A0
>     >>
>     >>=C2=A0 =C2=A0 =C2=A0Partly. For ARM, you likely don't need so may c=
hanges, see below.
>     >>
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0We could probably also eas=
ily support ARM, but the last
>     time this
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0question came up, there wa=
s still not A-core support in
>     Zephyr
>     >>=C2=A0 =C2=A0 =C2=A0which is
>     >>=C2=A0 =C2=A0 =C2=A0>=C2=A0 =C2=A0 =C2=A0a precondition.
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0>
>     >>=C2=A0 =C2=A0 =C2=A0> That's what I'm trying to do on IMX8M EVK in =
spare time.
>     There is
>     >>=C2=A0 =C2=A0 =C2=A0an ongoing
>     >>=C2=A0 =C2=A0 =C2=A0> PR for adding Cortex-A support in Zephyr, so =
I'm planning to
>     >>=C2=A0 =C2=A0 =C2=A0utilize that.
>     >>
>     >>=C2=A0 =C2=A0 =C2=A0That is good news. If you combine that with the=
 device tree
>     description
>     >>=C2=A0 =C2=A0 =C2=A0for inmates, actually those for the Linux cells=
, you should
>     be able to
>     >>=C2=A0 =C2=A0 =C2=A0boot without code modifications.
>     >>
>     >>
>     >> Don't we need MMU support in inmate? The current ARMv8 PR doesn't
>     have the
>     >> MMU support.
>     >
>     > Technically, we don't. Earlier versions of our demo inmates were
>     running
>     > without MMU as well, but as that implies running without caches as
>     well,
>     > we changed that. In any case, the inmate starts in reset state, mea=
ns
>     > with MMU (and caches) off.
>     >
>=20
>=20
> I got it working partially(not fully though). What would be the Flash and
> SRAM address would you recommend? The Flash start address should
> be 0x0 since that's the CPU default start address, how about SRAM?

I didn't play with targets where SRAM was involved so far, but I could
imagine that it will be easiest to map it at a location where it would
appear physically in exclusive use as well.

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
jailhouse-dev/0c7b7542-5f48-8f77-128e-26eee1f24ad7%40siemens.com.
