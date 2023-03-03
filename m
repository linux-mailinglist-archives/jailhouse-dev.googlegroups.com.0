Return-Path: <jailhouse-dev+bncBC2OZUPG4MCRBRO6RCQAMGQEWBAMBIY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3d.google.com (mail-qv1-xf3d.google.com [IPv6:2607:f8b0:4864:20::f3d])
	by mail.lfdr.de (Postfix) with ESMTPS id 152EA6A9DC0
	for <lists+jailhouse-dev@lfdr.de>; Fri,  3 Mar 2023 18:32:55 +0100 (CET)
Received: by mail-qv1-xf3d.google.com with SMTP id e9-20020a0cf749000000b00571f1377451sf1804875qvo.2
        for <lists+jailhouse-dev@lfdr.de>; Fri, 03 Mar 2023 09:32:55 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1677864773; cv=pass;
        d=google.com; s=arc-20160816;
        b=aMdiW2A6ON6m6GhVhH0kvyQgcOXDZaKMj9Jk68dfSfM5YXUlsiMqtTj5sPr1hsaBBd
         rqWOUZrYY1uKeh16UnVqyfGCu7HC4LP5eV+3h4d8DYO75XxZ3jCfb9Rg50IMfbOITHw8
         mFaqp4o9Kw8IADMRcjo+T9VNQLcL+HnEKxF7TJPuBaX4bN5zAmaJNaCpHBrJbJid2vgr
         bM6EEBQxU/cIZXP+Xj38X9RJ1aINmnYZkuXv1c7k1pql89tg2lnRhUrXkuK5O8gVaBXA
         ZLgaEzEE8gjZSHI7PIN6LEoIEgDqd76JTGP/HkKfquGv52b5rsM7j3z5e3rCLGtZZL48
         m+qA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=BnxKtEBEVGPMAD+rF0jGUdUPNYYlklqpV5/1H+wG2gE=;
        b=SYw+IFQ/4QsOok1FoRsl6X80I/iV7w+Fgq6gAs7DOtrcZ72dq04CrIdXLF6rDkt7Qn
         rl6HiRmpVjyhg4RJWdCkGDKDy3a/M4bhUYjFqLcxN5l6IWCakQA8SQuahRMaRDMN1GUX
         VuindHPNaIFafuAdGf1V00S4NhIsLh2dSAVFLuHGXgJmxvEZLWXawFdtFpUYFIvAQMCV
         pSZfRIXiLxR5E6PyeArnJWT16XqA7mgDiYRWyeqLiYg5sCkZy25PydQWwhtlO9o79zCm
         CrfRyV/B2Za7GmzJce27dh4M8d/zQYccKgGWlM1UV9Sys6RHR5vVdqQ3gtxdjR/LAFt9
         Rktw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=S78fm74y;
       spf=pass (google.com: domain of raffaelebtt@gmail.com designates 2607:f8b0:4864:20::42b as permitted sender) smtp.mailfrom=raffaelebtt@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1677864773;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BnxKtEBEVGPMAD+rF0jGUdUPNYYlklqpV5/1H+wG2gE=;
        b=rIThd5Ek2KbAih7LO3duLwOBiCTuNfbhozl6HvaNQUKPistQk59NkCqMovMBYJJApT
         2vgKZolB3p0a1Y6yZ7Quag50k/KPnWu2oM1I1ZPbzf/CbgM4fy6NysivB1+qPLHB1vba
         n5jIImaJF7r/MZQriE6w3gdChXBdLYaBve1XvKvMSMrJOp8fw+ixnVTNB5p2aWxu6ZgK
         unKMoilaMLg/5ecswPyXfheyGxwiZ7oEKUqtItEjoPds1oQ5Yf6cgdG8Feo19TUUMJYz
         IzRo4+R5AWDgBSZqnKnw1jDYxqdfCuLwrBI4NKxuMyvvaaWpwdnw7c8I2zvRYQq/qhTO
         4sbw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677864773;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BnxKtEBEVGPMAD+rF0jGUdUPNYYlklqpV5/1H+wG2gE=;
        b=Sb4+IN/5a33p71QnOWXwH5XC3Ys5827PrTEsVMvKF/LMUdr6/mdxvLuouYSwrna+lN
         PCtUeOQIMWL5Yhr5eZQrMJUylM8WIKnO5JvnDKky6WL5OmbAZ+FUyeGSwBr88NpTiqG8
         eaOZMTSycgZrRS/NA6np3XN24OX2NsOK/Ciw2LljD5tVSd1XJkKiUlTM74XXrh3HIC3b
         SBC1Q9kxafjG1b0y3le/I25zdXcFAMZ+K28G9Jv/HmoTaH+fKnjVVUvOf4uofnazNVk5
         S9TPaPpt8pjv5wLyCqMSxFBouWEHNHLpzyHMhdr5e4o6iFgNZbPb+osf13D5rX12rmzK
         bNNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677864773;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BnxKtEBEVGPMAD+rF0jGUdUPNYYlklqpV5/1H+wG2gE=;
        b=fEUaHHkE0D/irrnn33GaIf4xLeLrm68T974LLz6EKqxkoDY2Rb4cd+sKLUB68a33FW
         zMph60jYXXf5qBippKF6eB9o8gvKai6WnSjNl1e/Z4iWuVFPSOqOQuwYKnz1R4DPS6g7
         YNS3TcSiYbPZMIxjZ2nMKy1kmhi3s1qta9vEJKscvRtqVIivEdUBvnvdk96hkwvuB15q
         7YxptREcyhYMDFRSQLWmvdbxHfOV0pnpjZPDDiKxa397Y3E66qNdqPP+OvcywPmIaLBL
         dK0v4/9gjctIQfkoVY07Q8h7xie+oY9H72bXIp6vID4NGT2C5yIu2r61/gImIFVZBusu
         yiow==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AO0yUKVfTc6jfwGNBN0kZqjnaL9Lj1Q/m68qFQwKW1ISq5e5Rt/UxHdo
	BTQ8QNFm9Vkv/GUqzwvTlIk=
X-Google-Smtp-Source: AK7set9lTlxucnae+TczRqKQbG3cJqFzRfti83awNI1QG3cTssQc1r3xKjnutRu7FI/MNwfUkh9yNA==
X-Received: by 2002:ac8:155:0:b0:3bf:cdf8:61f4 with SMTP id f21-20020ac80155000000b003bfcdf861f4mr739867qtg.4.1677864773640;
        Fri, 03 Mar 2023 09:32:53 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5e10:0:b0:3b8:64eb:ae2a with SMTP id h16-20020ac85e10000000b003b864ebae2als3492656qtx.11.-pod-prod-gmail;
 Fri, 03 Mar 2023 09:32:52 -0800 (PST)
X-Received: by 2002:a05:622a:446:b0:3b9:b497:109e with SMTP id o6-20020a05622a044600b003b9b497109emr3127646qtx.18.1677864772792;
        Fri, 03 Mar 2023 09:32:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677864772; cv=none;
        d=google.com; s=arc-20160816;
        b=TiKsgtarLc7EgltH665iFJJEN7SU/jyr87bmTRK6xJtXP53/sGP8ahTbQv9jq9uxT5
         xBaM5e2Y3ESfwb03X57JvGhu/4pZ4sadUVPJCrXSvQGScNgB5NhSCIhA8alaJfaxg+HF
         qQ2EAzLYZ8uRF6mLJ7oJ4Oh1vJJ9VbT9AAzdOLZfPxpvNGvG7U0zys6JOhubgRwbwSjm
         yNR6ZRHcqLhpzSgVqO/tLLxKcmRJeD3Otp1HgqtXJB6CKvOuPkXD9qDDj/7GV5Vcl10w
         opDqL5a/wzhbXpI/vv7CgawmiUivV4gGSPyV6Hx7EMY+Qo5JiRCKDYnRxLl7FAANgKGf
         e7SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=mlhsxNg1W0OhdhZh+c7Hmj0ZUfaIuPmf16VFtJflees=;
        b=Mg+vPGd/g1O41XlnnMGCV2LxK4VlTGpLO1QdRcZuh7ncvE2suqmrNJEyASTkX4TXOR
         Ao+Ryqrn8bYyHOJEiyu02h9cG2aK/YZWSsItm0MF9e1dLfR6KZZp7z4GI7CPRtLTfM1o
         7mqit9UAN5xBGgHlUrrF7Opq777IJh3cJd3Yr2N4ZdOTTuQ2vDaOFji7jkxM2HXVJoG1
         KFd7GiuPgkZPS2cOERqaB/AWsOc5FVSbmSNUHAE/6ZJ4X2XOTyNL/EhuXAdSqv8fiWx/
         WofIViTnBQI27eb47W54qq3nAcbY3EU8H3f9t20SZ3BfoTZUTJJvXUQChMN5iOJz5drg
         829w==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=S78fm74y;
       spf=pass (google.com: domain of raffaelebtt@gmail.com designates 2607:f8b0:4864:20::42b as permitted sender) smtp.mailfrom=raffaelebtt@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com. [2607:f8b0:4864:20::42b])
        by gmr-mx.google.com with ESMTPS id br19-20020a05622a1e1300b003bfa7f2df56si204828qtb.4.2023.03.03.09.32.52
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 09:32:52 -0800 (PST)
Received-SPF: pass (google.com: domain of raffaelebtt@gmail.com designates 2607:f8b0:4864:20::42b as permitted sender) client-ip=2607:f8b0:4864:20::42b;
Received: by mail-pf1-x42b.google.com with SMTP id c10so2021269pfv.13
        for <jailhouse-dev@googlegroups.com>; Fri, 03 Mar 2023 09:32:52 -0800 (PST)
X-Received: by 2002:a63:385c:0:b0:502:f46f:c7c6 with SMTP id
 h28-20020a63385c000000b00502f46fc7c6mr766928pgn.1.1677864771643; Fri, 03 Mar
 2023 09:32:51 -0800 (PST)
MIME-Version: 1.0
From: Raffaele Battiloro <raffaelebtt@gmail.com>
Date: Fri, 3 Mar 2023 17:32:40 +0100
Message-ID: <CAObWrvcJxeuBEznc6myZ8gKikeAN+BdhoPKusQiyC=tr7yJdKw@mail.gmail.com>
Subject: Error while booting non root linux
To: jailhouse-dev@googlegroups.com
Content-Type: multipart/alternative; boundary="000000000000b1ee0405f60255a9"
X-Original-Sender: raffaelebtt@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=S78fm74y;       spf=pass
 (google.com: domain of raffaelebtt@gmail.com designates 2607:f8b0:4864:20::42b
 as permitted sender) smtp.mailfrom=raffaelebtt@gmail.com;       dmarc=pass
 (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
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

--000000000000b1ee0405f60255a9
Content-Type: text/plain; charset="UTF-8"

Dear all,
 I am trying to boot a linux non root cell in a qemu-x86 VM (version 7.2),
but launching the command I get this output:

sudo jailhouse cell linux jailhouse/configs/x86/linux-x86.cell  vmlinux.bin
-i bionic.rootfs.ext4  -c "console=ttyS0,115200"
Traceback (most recent call last):
  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 726, in
<module>
    arch.setup(args, config)
  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 256, in
setup
    args.kernel_decomp_factor, config)
  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 600, in
__init__
    self.setup_header.set_kernel_alignment(self.setup_header.pref_address)
  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 547, in
set_kernel_alignment
    self.set_value_in_data('Q', 0x230, value)
  File "/usr/local/libexec/jailhouse/jailhouse-cell-linux", line 527, in
set_value_in_data
    value)
struct.error: pack_into requires a buffer of at least 8 bytes

The config file is a copy of the demo file provided in the source
with an increased memory size (I also tested with the demo file). I
followed the instructions in the "non-root-linux" file and I was wondering
if the patches applied to the kernel are strictly necessary since I am
trying to boot a specific image.

Thank you for your help, best regards
Raffaele

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/CAObWrvcJxeuBEznc6myZ8gKikeAN%2BBdhoPKusQiyC%3Dtr7yJdKw%40mail.gmail.com.

--000000000000b1ee0405f60255a9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Dear all,<div>=C2=A0I am trying to boot a linux non root c=
ell in a qemu-x86 VM (version 7.2), but launching the command I get this ou=
tput:<div><div><br></div><div>sudo jailhouse cell linux jailhouse/configs/x=
86/linux-x86.cell=C2=A0 vmlinux.bin -i bionic.rootfs.ext4 =C2=A0-c &quot;co=
nsole=3DttyS0,115200&quot;<br>Traceback (most recent call last):<br>=C2=A0 =
File &quot;/usr/local/libexec/jailhouse/jailhouse-cell-linux&quot;, line 72=
6, in &lt;module&gt;<br>=C2=A0 =C2=A0 arch.setup(args, config)<br>=C2=A0 Fi=
le &quot;/usr/local/libexec/jailhouse/jailhouse-cell-linux&quot;, line 256,=
 in setup<br>=C2=A0 =C2=A0 args.kernel_decomp_factor, config)<br>=C2=A0 Fil=
e &quot;/usr/local/libexec/jailhouse/jailhouse-cell-linux&quot;, line 600, =
in __init__<br>=C2=A0 =C2=A0 self.setup_header.set_kernel_alignment(self.se=
tup_header.pref_address)<br>=C2=A0 File &quot;/usr/local/libexec/jailhouse/=
jailhouse-cell-linux&quot;, line 547, in set_kernel_alignment<br>=C2=A0 =C2=
=A0 self.set_value_in_data(&#39;Q&#39;, 0x230, value)<br>=C2=A0 File &quot;=
/usr/local/libexec/jailhouse/jailhouse-cell-linux&quot;, line 527, in set_v=
alue_in_data<br>=C2=A0 =C2=A0 value)<br>struct.error: pack_into requires a =
buffer of at least 8 bytes</div><div><br></div><div>The=C2=A0config file is=
 a copy of the demo file provided in the source with=C2=A0an=C2=A0increased=
=C2=A0memory size (I also tested with the demo file). I followed the instru=
ctions in the &quot;non-root-linux&quot; file and I was wondering if the pa=
tches applied to the kernel are strictly necessary since I am trying to boo=
t a specific image.</div><div><br></div><div>Thank you for your help, best =
regards</div><div>Raffaele<br><div><br></div></div></div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAObWrvcJxeuBEznc6myZ8gKikeAN%2BBdhoPKusQiyC%3Dtr7=
yJdKw%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAObWrvcJxeuBEznc6myZ8gKikeAN%2BBdhoPKu=
sQiyC%3Dtr7yJdKw%40mail.gmail.com</a>.<br />

--000000000000b1ee0405f60255a9--
