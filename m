Return-Path: <jailhouse-dev+bncBAABBYVBTSDAMGQE52G2POY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x237.google.com (mail-lj1-x237.google.com [IPv6:2a00:1450:4864:20::237])
	by mail.lfdr.de (Postfix) with ESMTPS id 253713A5E3F
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Jun 2021 10:18:43 +0200 (CEST)
Received: by mail-lj1-x237.google.com with SMTP id h6-20020a2e85c60000b029014fcff4ccdcsf4203474ljj.11
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Jun 2021 01:18:43 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1623658722; cv=pass;
        d=google.com; s=arc-20160816;
        b=bXeo3eOLYTlSjOeIzWuUMmlKHa5bJXv7ZUFretQit3s2Eqc33oVFgSPSCfrL7I6ejU
         +se8lgJgkPHPV5R7YwnlrdWLuQvNNp3aWYj+Rd1BgpjrlpzaFL7IIJAN9V5ToKYAxoDG
         o5fXHBycpmHACt5UoGcXD1kDPNGxSdR3B/qIpnac+AkypSvClDAj9NiHvVkbkHYwrVrL
         veV/ojurxs2hh2SpjxEGkj9+eVsDTEq8v10AyQgq8eLJeU7Wk8fCN3l7I4Ln31SVCctV
         wtpml4F6lBMnhFEaYbUGNMOOgsLX5Xqpph6whjS2C3RdyhsbNbSBdyGqaJTppA6nvK6u
         IUug==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version
         :content-transfer-encoding:content-language:accept-language
         :in-reply-to:references:message-id:date:thread-index:thread-topic
         :subject:to:from:sender:dkim-signature;
        bh=w8k5l4IrqZTwhXB8p33gDVXXdP2AUXlkW86tbsd3Eds=;
        b=p1ruSa3hqkSl8aULs/EspI3zF/iiLAXkpAePCzsFXESMLtsn4kTaa8ZxVqjyEz+wn7
         J+Cr1PZuw3WJDJBQDKZTjubQbcanznLGEZ9jUa2uOyVU/qZzqg/+f2XVId8HFwl58+Ag
         PE3gX1nbgGJp8LUVx0WJcqLsJh/E53kGez95ol3fa0fzqmx/28NHArF+nSlnff7Q26ci
         IzGsshZpD+FU9QGPODuYa8wDaxBu9Lfu9hLmp7IyzjwIfV4p3P3QxwN1elmefkV5xbGl
         lGTqylUTYiCVgy/aWadxNAljoiqA1zBes6ViOS0ksNqpLFlWyd/C7HzAmoEDSfTLH9pD
         trAA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=qjn33FeO;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:thread-topic:thread-index:date:message-id
         :references:in-reply-to:accept-language:content-language
         :content-transfer-encoding:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=w8k5l4IrqZTwhXB8p33gDVXXdP2AUXlkW86tbsd3Eds=;
        b=DJ3AFDcbx+MKFVLWadwC05P3HnUa24S9DzP5VpdghaPIgCJn+iz/tSemjSA5Ed+NKU
         cwwiuCyVeNNc5MQAmA2CM7NKVazxNlN/ABHimGaJswZn3B7NMeJlVA90m4jJWgu5t/8g
         hFgXhQgfwGkqEjQCbFElXYlljPTdKt5azZoOnhaSadn7itvttUoVzQub8lMhq1xisx+K
         jhE4U8QEt9wp6CmH4IJJ5ExPF528xNjYVGBNHIRfjxccZojfgqNb4VOP6Fg9rZhX8x50
         yUrg4BXWtwaNr+TF4Ivg4sYBovD+dj1Dw5MimCT/viCzTaq8PgZEMsbHYBBBvNwl4mmM
         qGGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:thread-topic:thread-index
         :date:message-id:references:in-reply-to:accept-language
         :content-language:content-transfer-encoding:mime-version
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=w8k5l4IrqZTwhXB8p33gDVXXdP2AUXlkW86tbsd3Eds=;
        b=svjQf+4a53IVEgVjGbRWxn5ngsHdTZ8kVQrHWSr6vsY1AZqgXfYfHY9SM/6EZCWK8B
         pGpA1M6TQ4XGM4E/Rkk5yls+L873dWPUByuyI/b5nc6zld6N70efTdg7Lql7cbPjpfr0
         YRkglRpC3jJpo2F34jCZNsgxYOfDAXm/ejl6JL58MLdI07F3FCr3R5myHdL2htu18sk3
         aaXuPWSx+MTiimvkW9AiWPAH8IGESqi8A/8TeAf7EwgjL5LsCliC/U866pPGyQwc4jek
         xQC+kXYrYOK7rhMLhbU6iXDJoPuCj4mC0Va3LbkbEVSeOpOq956ZJK0IugHPRjEuwBrr
         ZAIA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533vD51M9Mk/4J4jdQddJ/PxA8Dkh7o4Aqt02w1wpUPrdxFpsmHu
	k9Ts2IBngSwb2JDWkyoejqQ=
X-Google-Smtp-Source: ABdhPJxo/pm5R47DtHnft1itShBLkuZxgOcGODCvvv8kk3lrAx3EJRNZRbe9Lbo2tIwZndmHZ+zdfQ==
X-Received: by 2002:ac2:509a:: with SMTP id f26mr11467866lfm.505.1623658722575;
        Mon, 14 Jun 2021 01:18:42 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6512:3f94:: with SMTP id x20ls2683606lfa.0.gmail; Mon,
 14 Jun 2021 01:18:41 -0700 (PDT)
X-Received: by 2002:a19:ad44:: with SMTP id s4mr11147304lfd.563.1623658721723;
        Mon, 14 Jun 2021 01:18:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623658721; cv=none;
        d=google.com; s=arc-20160816;
        b=YHqGxoIsyTDfPcRlx4QidTf9148ybMugOe0gmpIkcLz1phlzABgcE49+3hdzeYCeHG
         jOl+v8ZfF3C7btX2cQ7DA90hy4G45Z4c0TqfjjRvQmipURrKNdO5ZqmqN+RLdGs7xHVd
         fUuXqPDPNfwnyt4iC+eNqLQNzAefzNh4WhVMpUEokzpwelp1j8S/kWrjPs0y8C9B7U49
         jUTZRhjlqlvLa6gvLkadtH4DNmxA529PgWYOKHBpPBd/z6vQXswX62XG7HP7lw7buzfN
         CvUPMPl8yq+9cCdvWcf+DUIUOc98463NRYPUIv4iw77plck+fp1We064M/Hi7SiMVbNM
         kBGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:content-transfer-encoding:content-language
         :accept-language:in-reply-to:references:message-id:date:thread-index
         :thread-topic:subject:to:from:dkim-signature:dkim-signature;
        bh=iW4xFRjJsowJ6Zpofuom82B/WHyUMarnbbjqGw259NM=;
        b=Rxgr8x4emrh3ukgsCVFJdd7clPKl9EYvNeby8DvEyaRxpArc1CmkdiGO28zvzaApS7
         d6Sn837ea+/t4ycfyW648TtYG9Rc65rVDFN9MBBjY9eeoeyYR+SEISDPhVy3sejiLOBv
         +AsVXIxirgjOb5wD8ICmuHTTxbDTBduEbydfF4MP3/dn+xmxIdXiBG0W3Cr/tgz+EXuU
         ia9pRW6qgdFuU+0F6nnHacTywEk0UErfDGEdObEe5YrDIx14swZoBGM5yO9zBM0nTZon
         Q8N6JaZNNIqxhQ1rnGKN/2o8L6uPOnXIA2xmq0M31B9ZoQl4p4WCV7jBFd5dcAwCVza9
         1v3w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=neutral (no key) header.i=@uni-rostock.de;
       dkim=pass header.i=@uni-rostock.de header.s=itmz header.b=qjn33FeO;
       spf=pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) smtp.mailfrom=moustafa.noufale@uni-rostock.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=uni-rostock.de
Received: from mx1.uni-rostock.de (mx1.uni-rostock.de. [139.30.22.71])
        by gmr-mx.google.com with ESMTPS id q10si524229lfo.11.2021.06.14.01.18.41
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 14 Jun 2021 01:18:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender) client-ip=139.30.22.71;
Received: from 139.30.22.83 by mx1.uni-rostock.de (Tls12, Aes256, Sha384,
 DiffieHellmanEllipticKey384); Mon, 14 Jun 2021 08:18:35 GMT
Received: from email1.uni-rostock.de (139.30.22.81) by email3.uni-rostock.de
 (139.30.22.83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.858.12; Mon, 14 Jun
 2021 10:18:34 +0200
Received: from email1.uni-rostock.de ([139.30.22.81]) by email1.uni-rostock.de
 ([139.30.22.81]) with mapi id 15.02.0858.012; Mon, 14 Jun 2021 10:18:34 +0200
From: Moustafa Noufale <moustafa.noufale@uni-rostock.de>
To: Jan Kiszka <jan.kiszka@siemens.com>, Jan Kiszka <jan.kiszka@web.de>, "Ralf
 Ramsauer" <ralf.ramsauer@oth-regensburg.de>, "jailhouse-dev@googlegroups.com"
	<jailhouse-dev@googlegroups.com>
Subject: AW: [EXT] AW: AW: Inquiry
Thread-Topic: [EXT] AW: AW: Inquiry
Thread-Index: Adcx+AFw6wu1ws16QgaPAGku5ayIpgBZYRUAAJpN+xD//+LWgP/67wQwgApfIwD//qzLwIAD6CkA///bZqAABW1CgP/0//LQ/+neqwD/qQmIwP9O6rgA/ohF8GA=
Date: Mon, 14 Jun 2021 08:18:34 +0000
Message-ID: <b38f413b91cd4b4686d636b57fe3665f@uni-rostock.de>
References: <0631a4941db6453491ffecf6c08b1cf7@uni-rostock.de>
 <61de29b4-45a2-8f3b-5937-5cac7dfc2b21@web.de>
 <879f50f352e14aa8b45e9aff399c2b02@uni-rostock.de>
 <0b2f286b-b5ed-8de9-e0a2-73af9f9cbedf@oth-regensburg.de>
 <aa35f9463dd64b96a3998e9fe84da04a@uni-rostock.de>
 <d6df4ded-1fb9-f75d-1a1b-0cef2513acf9@oth-regensburg.de>
 <857f4a45c58d4a85b336ac6f3028e5be@uni-rostock.de>
 <688b5cc9-6150-dab1-0a0f-a7b5cb8d54cf@web.de>
 <c029ad37ed324934b2e0aa3f05ad1713@uni-rostock.de>
 <34742299-7898-adb3-30b8-760bc4596e92@web.de>
 <c53790d5ecf3411cb1990106e9663ecc@uni-rostock.de>
 <b53ac6b9-013d-f9b5-1543-4bef294914bd@web.de>
 <0f730442242846238f7a5695a4a04f2f@uni-rostock.de>
 <1fb2994e-bc44-c9d6-1678-d574abaabbf4@siemens.com>
In-Reply-To: <1fb2994e-bc44-c9d6-1678-d574abaabbf4@siemens.com>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [139.30.78.30]
x-tm-as-product-ver: SMEX-14.0.0.3080-8.6.1012-26218.006
x-tm-as-result: No-10--0.671400-8.000000
x-tmase-matchedrid: mQjprurG1C4MPDZrnvcM98CxC+PryYbTgdkHykGcMpkc0nbYaP5Pw2/G
	3rIUkaQ/+BOjo2yX4ihpp0fjYCsnvOCsfNMVMFT/I7qctJOE9rpboh0Au8fxU23D6f6IpbLIgPX
	63pRdlB7uEnUaPx7Fx1cHsTrnFJbcZw88sE7YDRuJUlmL3Uj0mEi8rgutezVpBaq8VaDdeDpPnX
	Z9u2IhHeNfOEkgLs4h4uFH5KkEqwXop716F6VnSo61Z+HJnvsO+KgiyLtJrSDm99ZTkFXv4DeKo
	S2+oeg1t9YOQZdUjfbNYGI5yLgJoiBLlbmwJ5BU9m9PbNihg7AL8TGleseLPIoij12xHbPud0ji
	0I3JWy/DTU6c1OixxQK2t8hsc3EOR/oM2cgUsZqejeo11iW0N35Lmbb/xUuaC90qCYhaPKlrFmV
	fWDAwW81j70qfy418tTOrxEGQm4apGVKHYEvAH+fOVcxjDhcwPcCXjNqUmkXCttcwYNipXxf2uk
	Fm4ENtJLkAVeblqukpWjIHGH+JhDpc1OekkcQ/DsENU3lNnkjlDloKO0O7UTX83UNjtAVgq1Xq9
	us2FP2FSfT/ebb2ih38WlgqGbUiAxY3/5ZR+aveIBMBjThSnOSN26WiDpeab/9Eev9tHa0=
x-tm-as-user-approved-sender: Yes
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--0.671400-8.000000
x-tmase-version: SMEX-14.0.0.3080-8.6.1012-26218.006
x-tm-snts-smtp: C7C3EB9012C5EF56DC5AD418B96E47C4CD1DE0060A14248A4F250AD6AA86F5202002:8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-Original-Sender: moustafa.noufale@uni-rostock.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=neutral (no
 key) header.i=@uni-rostock.de;       dkim=pass header.i=@uni-rostock.de
 header.s=itmz header.b=qjn33FeO;       spf=pass (google.com: domain of
 moustafa.noufale@uni-rostock.de designates 139.30.22.71 as permitted sender)
 smtp.mailfrom=moustafa.noufale@uni-rostock.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=uni-rostock.de
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

Hi Mr. Kiszka,=20
I spent the last two weeks trying to compile Jailhouse on Coral-Board [Linu=
x 4.14.98-imx aarch 64]. I have been facing this error:
home/mendel/jailhouse/configs/arm64/dts/inmate-amd-seattle.dts:17:54: error=
: no include path in which to search for dt-bindings/interrupt-controller/a=
rm-gic.h
I followed a thread about OrangePi [1] and tried to provide absolute paths:
sudo make $KDIR=3D/usr/src/linux-headers-4.14.98-imx/include/linux/irqchip/
I get no rule to make target 'modules' stop error.

What I understand is that he kernel source tree binaries are not appropriat=
ely built. (.dtb)
Then a comment from Mr. Ramsauer mentioned that the kernel must be patched =
in the same thread[1]. So, I would like to ask, if you can give me any reco=
mmendations?
Thanks in advance.
[1] https://groups.google.com/g/jailhouse-dev/c/pwYGLSX_2Rc/m/AhzdSz90AwAJ=
=20


-----Urspr=C3=BCngliche Nachricht-----
Von: Jan Kiszka <jan.kiszka@siemens.com>=20
Gesendet: Montag, 31. Mai 2021 18:47
An: Moustafa Noufale <moustafa.noufale@uni-rostock.de>; Jan Kiszka <jan.kis=
zka@web.de>; Ralf Ramsauer <ralf.ramsauer@oth-regensburg.de>; jailhouse-dev=
@googlegroups.com
Betreff: Re: [EXT] AW: AW: Inquiry

On 30.05.21 13:30, Moustafa Noufale wrote:
> Hi Mr. Kiszka,
>> To enable Jailhouse on the Coral board as well, you likely have three
>> options:
>> - ad-hoc compilation on the board, using their "Mendel Linux" (also
>>  Debian)
>> - integrating Jailhouse into Mendel Linux
>> - defining a new target "Coral dev board" in jailhouse-images,=20
>> porting  the integration from Mendel Linux over
> I have just got the Coral board and I think I would go with the first opt=
ion. The planed workflow is:
> 1- duplicate imx8mm.c /imx8mm-inmate-demo.c/ imx8mm-linux-demo.c and edit=
 it with the memory addresses in Coral Board, which is also using an imx8m.
> 2- compile jailhouse on the board.
> 3- insemod jailhouse and run.
> I am only asking, whether I am going in the right path.

Sounds reasonable. Problems can lie in the details, but those you will only=
 find when trying things out.

Jan

--
Siemens AG, T RDA IOT
Corporate Competence Center Embedded Linux

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/b38f413b91cd4b4686d636b57fe3665f%40uni-rostock.de.
