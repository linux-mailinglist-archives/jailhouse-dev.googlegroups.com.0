Return-Path: <jailhouse-dev+bncBC653PXTYYERBKFISOEQMGQEYCUTAMA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x838.google.com (mail-qt1-x838.google.com [IPv6:2607:f8b0:4864:20::838])
	by mail.lfdr.de (Postfix) with ESMTPS id 483BC3F5CF1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 13:12:42 +0200 (CEST)
Received: by mail-qt1-x838.google.com with SMTP id e3-20020ac80b030000b029028ac1c46c2asf10338050qti.2
        for <lists+jailhouse-dev@lfdr.de>; Tue, 24 Aug 2021 04:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=lOhZkgsmCrk8vAKSGwihLC6yJqVtpGSnQepviS+DhWc=;
        b=i9TvKWBpEHNg9Rc240JyccDW96T7i4ZBtyu/5AUVWQNOQuTTTw2Lk+4BRF44ZUzqt1
         +z8JIyhBQCoy6Q4XP1YqLojg0l3LOLdQlHXUGC9pk+dtoLmTeuPtljyFClhxRMX/y6j6
         By6KFyA0S7dlV3sFms1Ri25Yjlr8HPaBDdKXZVO0B5ED02+DYuv0QGg/ZFKvNtlLfmJB
         M/+E04iNLeZ8ZNY7Cxqf1ncvGcWtels3yTP8+bXje5JSLBhuyF3fVENpM0l1KuQeiAbw
         EBFK/oercobRD9R8tAxQAtPQyXjDjub88AdU9wrxpjwzcZHtOqwSO8k8VQsWt74BxSbZ
         a80Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lOhZkgsmCrk8vAKSGwihLC6yJqVtpGSnQepviS+DhWc=;
        b=kI5WTmgd2nxnFI/5bGb6sVg+stGt0eGubHFC/ZRc1le/8vw8HLH6JDycAmBatAIdkH
         21HjrHlEtIuKHCdSmtROtqkH6zRxPArn8uvMLWpX0AN6bse5H11QKdlCgA/FF5nGb6H8
         zvNlfUPjaS65PT2B8a2lO8IlwUfjScimgH1XnM3d52TJWcH5NgVHHj5+/pvbH0b6Qww/
         FIfwEyCZSB2ZaQKD4Uu4OfG8RLUcY7sZf9KvvUz5be+Nxw+7skSC4+qDA1mfh8bFvcMo
         xTamrdj1BWgHgGbReIFy8+whikmz4H1KHbey5b06dKccglWVkZsEPMIs5l/eMo+Hagdp
         AkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=lOhZkgsmCrk8vAKSGwihLC6yJqVtpGSnQepviS+DhWc=;
        b=qmzZgunFvmAp5hQoTQck4OLEwT/VParSTMma4+sUSn0z0xl6jMwLi2dwEIiWxOXor5
         riESzSQjEWpacQTJQgcHpPjppqSUNI9HXMwyxAl4BDbd4LFsjbwg2B02FO/UHhjHGZb1
         aZ1f1NB3CLgFRv0mYuIaqQ0gOzwMn9iZyRWvNd0+EZI7A425g1pP2FiMdpv2aff3RnVn
         v/CfChpyGS/ILSDQIsJ7VhWEhoUTs9kLA2hgSKHfqMy6FabHIV9tcEHpXuJuAxdhIDqH
         B/Lcu1m0iR7cZsDVPjlmxflhUwHNSUfvQqzoiRKs1C4R6bOdP8ked11WWh7EeWzKwerB
         vXfw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM531x4NECquCngTPq0qsmcWIFIZAtUEpMl7fFis+dIsMjoTwe94y8
	6taJDLNQno+/h+Yzi5g5JIU=
X-Google-Smtp-Source: ABdhPJyErPOEp8zRCMYZm19g7qDbZvRYhb7Eho0yuCFb3YJfMXiJhOl7pkRt+fjQlryEb/R3ofdhyw==
X-Received: by 2002:a05:620a:2488:: with SMTP id i8mr26029053qkn.58.1629803560871;
        Tue, 24 Aug 2021 04:12:40 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:1a13:: with SMTP id bk19ls3633984qkb.3.gmail; Tue,
 24 Aug 2021 04:12:40 -0700 (PDT)
X-Received: by 2002:a05:620a:2012:: with SMTP id c18mr21200948qka.312.1629803560215;
        Tue, 24 Aug 2021 04:12:40 -0700 (PDT)
Date: Tue, 24 Aug 2021 04:12:39 -0700 (PDT)
From: Moustafa Nofal <mustafa13e09940@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e76f8186-671f-45c8-afc8-8c85b3988c43n@googlegroups.com>
Subject: Building a Baremetal OS for Raspberry Pi4
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2120_1179487650.1629803559729"
X-Original-Sender: mustafa13e09940@gmail.com
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

------=_Part_2120_1179487650.1629803559729
Content-Type: multipart/alternative; 
	boundary="----=_Part_2121_490992442.1629803559729"

------=_Part_2121_490992442.1629803559729
Content-Type: text/plain; charset="UTF-8"

Hi, thanks for your support for the last three months. 

I am trying to make a simple scheduler and include it in the inmate file, 
in order to implement a rate monotonic scheduler and analyze the results. 

So, basically the most difficult part, is the context switching. I used to 
combine assembly and C using __asm, but I do not think it is supported in 
Jailhouse. I found some files in hypervisor/arch and inmates/lib/arm64 that 
are in assembly. I wrote a simple file in assembly and added it to the 
directory inmates/lib/arm64 and I got this error:
error: stray '#' in program ldp x25, x26, [x8], #16
I tried also adding some assembly code to a header file in 
inmates/lib/include with different tags for beginning assembly: _asm, __asm 
, asm and .asm, but I have the same error. I checked also the makefile and 
I think the file should be built without a problem. 

My question is, whether there is some constraints that I am missing?

Thanks in advance
Moustafa Noufale

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e76f8186-671f-45c8-afc8-8c85b3988c43n%40googlegroups.com.

------=_Part_2121_490992442.1629803559729
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, thanks for your support for the last three months. <br><br>I am trying =
to make a simple scheduler and include it in the inmate file, in order to i=
mplement a rate monotonic scheduler and analyze the results. <br><br>So, ba=
sically the most difficult part, is the context switching. I used to combin=
e assembly and C using __asm, but I do not think it is supported in Jailhou=
se. I found some files in hypervisor/arch and inmates/lib/arm64 that are in=
 assembly. I wrote a simple file in assembly and added it to the directory =
inmates/lib/arm64 and I got this error:<br>error: stray '#' in program ldp =
x25, x26, [x8], #16<br>I tried also adding some assembly code to a header f=
ile in inmates/lib/include with different tags for beginning assembly: _asm=
, __asm , asm and .asm, but I have the same error. I checked also the makef=
ile and I think the file should be built without a problem. <br><br>My ques=
tion is, whether there is some constraints that I am missing?<br><br>Thanks=
 in advance<br>Moustafa Noufale<br>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e76f8186-671f-45c8-afc8-8c85b3988c43n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e76f8186-671f-45c8-afc8-8c85b3988c43n%40googlegroups.co=
m</a>.<br />

------=_Part_2121_490992442.1629803559729--

------=_Part_2120_1179487650.1629803559729--
