Return-Path: <jailhouse-dev+bncBCJI7SMNV4NBB4NVR7VQKGQEQJZNHZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-lj1-x23c.google.com (mail-lj1-x23c.google.com [IPv6:2a00:1450:4864:20::23c])
	by mail.lfdr.de (Postfix) with ESMTPS id C20079D027
	for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 15:13:22 +0200 (CEST)
Received: by mail-lj1-x23c.google.com with SMTP id u3sf2885005lji.3
        for <lists+jailhouse-dev@lfdr.de>; Mon, 26 Aug 2019 06:13:22 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1566825202; cv=pass;
        d=google.com; s=arc-20160816;
        b=mJSMUlLzIpAPFp5icmVoKesNSFhhyYFo2xHUG2Rb0tKf5w0P2r8vELO1rTmFTHAOLZ
         RbvY4Xyx0JkMsbHgLXTUlTqSSz3ULD78r3/kZfMtBbCtOw+/rdvq06phgzamicTWbF4N
         XKrazdA+u6aLHGTtgvmCFs4ADByZke8efuaH+NfK92tUOsU5un11UBApvIcjQexWgCnW
         KQGsYuoKIG3BR7dBlxS2RtbvwGVj10yiU6lElCpNEKJAHIFWzoU7G9HZMfcctLLUgvRG
         gGXWIe0VdPW03t+jeo0KHilwnOsHTqrNV1+G6dOzs8hvWYjns3bFYAgkguQMbnXCULhC
         XL0g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:sender:dkim-signature;
        bh=/ZlS3lex1NqWtQDKTHcCdP1TrU49P53Bbt25RdeDNC8=;
        b=aWkE1Xwiy//HJ9gscNb5amjd+Gs+oSWtXnrOLkmkNlo6h5NrXNp6qxJfEGzWBlPb9c
         BBk2EpIXmQQkQQbYJdsbmnHYxJ3gZ1d8TB7tsIqO9F5qj5QEr/gekWhNQ4cIjnoGSFZ7
         L7JUQQQ7GrsJrhV48pFscUJRGFB5zkITn1whb60m9FvSMQKXoh7C//USH8hVupEuDb7E
         nRsTYgXAnaEhBnlMUaJtYx7BvjKrZFxSfrTaMK91lSTQc2NCp4kKncgOsRqvA697WlUJ
         SzoOe/Tz9+tOAYrSnS6ax7ssYz8yGKFqPpPBohM2Y1xXi54IQ6VjZCwbJpQDe1l6ptAC
         HbyQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/ZlS3lex1NqWtQDKTHcCdP1TrU49P53Bbt25RdeDNC8=;
        b=JOVOaqf/uyDl7r+Fh5sIdL9Pj8c8vivo7KwkLFy+gr2QvkkIYj+ImE1N4YWY4EzEBw
         1fF2xjkwvYQPDASkoU8pz/MqcR3JxMY45CiuKPdWoVzj1+5kMhgkUrWiuYFAQpARaBxV
         vE/VLwv8SrCLxtcZs8HDmWUVv+M/VfvUGcMAOcYAKfJNBWxd3QpzoyppAY2qjBH9BfNM
         /HhmiAP+B59MmzhQAZbqP1mpOmw5Zrh2ni/TznAk5kCjQqr+Ik6uNRefJGe7OQrNeFaU
         hG/mFlEOtqnUEtqRm0rO8gVnmcKbbsET2yoNPueTFM56L1K1KsXln7fhV6QDHE+x4/jW
         mTcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/ZlS3lex1NqWtQDKTHcCdP1TrU49P53Bbt25RdeDNC8=;
        b=PtENA3ebERACh4XwQJftppNIHcKvZ1sEuQhX8/SgW3KD0P/Y2AyxW6oNm9cHhqJsaU
         G96sxtRTfR4NOtNxgsstYROMy5QsRYE5B3O7mbFrZr4NLxbjGhwPmYoCmztAY6kZ2FP+
         zOjrEgHfyrxtjfGfTqH4mlW4h6VCiqdD73JBezXasSiqm/BHWzfP1cDppz/S+ZmfoWAS
         S53JL2EMHhNHXEjl5D65erGJ/vCbZDS0620tnPRzFZt0ghks2I88pSN2ti5vCyJK7goV
         5UoLwH5eH3mnSD/0SAmzEupaywXTt0qNVwM7BHE2spvfRiMJbRMdr7uH6HywOJ+b43rr
         YFHA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: APjAAAVnor1EredW7Bfoe016ie0+YKbsNcGAAYAZYgfKYLQCewHzq8Cu
	htNMdcVlno7Qm82D/3CKcd0=
X-Google-Smtp-Source: APXvYqzAUei6f3vDtxXnqcgeQBdjqFsSM1Tv2dlV8cp+bPjXXGCi5HGvo+feT6oyRWNyfvkOOhT/Yw==
X-Received: by 2002:ac2:43ad:: with SMTP id t13mr4343167lfl.66.1566825202293;
        Mon, 26 Aug 2019 06:13:22 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a2e:299c:: with SMTP id p28ls1873679ljp.2.gmail; Mon, 26 Aug
 2019 06:13:21 -0700 (PDT)
X-Received: by 2002:a2e:9ecb:: with SMTP id h11mr4382548ljk.6.1566825201432;
        Mon, 26 Aug 2019 06:13:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1566825201; cv=none;
        d=google.com; s=arc-20160816;
        b=sSITea3GzVA2ijV6HjoQvP+68EdmtA0x9hG6tDDuAMWG9EZlJCqdp8+mdKivCkmpLM
         431AC08pjp6C6RzU9rE9D3EQSt0jd+5AgFHtnn8pzx1nNlUX9KBKKBRmlIhQz9V3TghR
         HBIDIn2RhPnUxE5IoQZPIfSLmEwIhNn4jhh7hY5eu6ylG46o1tlIMgFov65qEjh9eml8
         cBKjCD192PAwHldDQbRvhlMoA7zzbO6ACWiFdCbSKBGugQFaWEiy98vZehO5v3lPuhwv
         Avk4sLRYMINinrZp6k1YOk8ryS1tZ2AgxTIETFBhZUYyDcxViDSZn/g9sDW2C6qtO3hW
         sLiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject;
        bh=S4dDdtOM4bLPHxoH1h+d5iec12T7ED5IMwBEqTvf2Ew=;
        b=AmwGiKq07t4HesQm28t+64x0wTK+PSLD3Zv0pc57wUIe01exmcKQQ1KD9C+7rIIqxw
         JsPsFlThvyvibspObdun1Y2bL8wGbCziV+k6S7vpPclFC32tE8MpwEnfPqaKnvA3InVW
         CEBiIHd95HVLEJbyreuWGENWGUkhjYBcjt2jhUIB/W4T/zYsFOgTgaKt4EmL0FRmih5f
         4EwrT47mkRNSye7yG9TIFlzIKFTOAwo1meqvB2PnJz1HMNjHcP4TR4ZWjfIbTIGYFAen
         aO/xd5kCrp1lPTBLO8kpdq4yB3cozzHniz2AWjDfocGblpBOzqDqBUH+fVDzku99uMUQ
         vTAQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) smtp.mailfrom=jan.kiszka@siemens.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=siemens.com
Received: from lizzard.sbs.de (lizzard.sbs.de. [194.138.37.39])
        by gmr-mx.google.com with ESMTPS id c12si814731lji.0.2019.08.26.06.13.21
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 06:13:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of jan.kiszka@siemens.com designates 194.138.37.39 as permitted sender) client-ip=194.138.37.39;
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by lizzard.sbs.de (8.15.2/8.15.2) with ESMTPS id x7QDDKRO015503
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 26 Aug 2019 15:13:20 +0200
Received: from [139.25.68.37] (md1q0hnc.ad001.siemens.net [139.25.68.37] (may be forged))
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x7QDDKuJ023061;
	Mon, 26 Aug 2019 15:13:20 +0200
Subject: Re: IO access in jailhouse root cell
To: Oliver Schwartz <Oliver.Schwartz@gmx.de>, jailhouse-dev@googlegroups.com
References: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <fc5e2fab-3339-2dac-0a61-7a3647873a42@siemens.com>
Date: Mon, 26 Aug 2019 15:13:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <76008E6A-1653-4358-AD31-4C8D332759C1@gmx.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
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

On 26.08.19 11:44, Oliver Schwartz wrote:
> I=E2=80=99m stuck with a problem when accessing IOs from the jailhouse ro=
ot cell.
>=20
> Background: I=E2=80=99m running jailhouse on a Zynqmp ZCU-102 like board,=
 with additional peripherals attached to i2c and SPI bus. The basic Linux s=
ystem is Petalinux 2018.2 (Kernel 4.14). I can run the zynqmp-zcu102-gic-de=
mo and have successfully extended it. The configuration for the root cell i=
s zynqmp-zcu102.cell from the jailhouse repository.
>=20
> Before starting jailhouse I can access my i2c and SPI peripherals from Li=
nux without problems, using either kernel io modules or direct i2c access f=
rom user space with i2cget / i2cset. Once I enable jailhouse (just the root=
 cell, no inmate configured) access no longer works (e.g. i2cget complains =
=E2=80=9Cresource busy=E2=80=9D).
>=20
> The i2c registers are located at 0xff020000. This memory region should be=
 covered by the first entry in the root cell config:
>=20
> 		/* MMIO (permissive) */ {
> 			.phys_start =3D 0xfd000000,
> 			.virt_start =3D 0xfd000000,
> 			.size =3D	      0x03000000,
> 			.flags =3D JAILHOUSE_MEM_READ | JAILHOUSE_MEM_WRITE |
> 				JAILHOUSE_MEM_IO,
> 		},
>=20
> Interrupts should also be delivered to the root cell:
>=20
> 	.irqchips =3D {
> 		/* GIC */ {
> 			.address =3D 0xf9010000,
> 			.pin_base =3D 32,
> 			.pin_bitmap =3D {
> 				0xffffffff, 0xffffffff, 0xffffffff, 0xffffffff,
> 			},
> 		},
>=20
>=20
> In fact, register access seems to work after enabling the root cell, so I=
=E2=80=99m suspecting some other cause.
>=20
> Any ideas? Are there any kernel patches necessary for the root cell kerne=
l?

Nope, when just the root cell runs and you have permissive configurations,=
=20
Jailhouse is supposed to be transparent.

Can you track down where exactly the error is generated? Maybe ftrace with=
=20
function-graph tracer can help, otherwise code instrumentation.

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
jailhouse-dev/fc5e2fab-3339-2dac-0a61-7a3647873a42%40siemens.com.
