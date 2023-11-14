Return-Path: <jailhouse-dev+bncBD6ZDC4GXENBBZHEZSVAMGQE5TU2HOQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3a.google.com (mail-yb1-xb3a.google.com [IPv6:2607:f8b0:4864:20::b3a])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0B17EABC1
	for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Nov 2023 09:40:06 +0100 (CET)
Received: by mail-yb1-xb3a.google.com with SMTP id 3f1490d57ef6-daf6c1591d5sf1904754276.1
        for <lists+jailhouse-dev@lfdr.de>; Tue, 14 Nov 2023 00:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1699951205; x=1700556005; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUzXZ80kXz2yYmJBdSxtKDDGUZclLamfgYCcie/5pQ8=;
        b=F+bZLaRsWJQCdKFdmbcGAUig6ntWr/lHoSl1bVyyGbX0xtuRqDUILDmCDzb8cxSZrg
         D/tACkUBeko6PfimwIk2MrlQ//ZVhRIb/L3b23BgNjijPhuMckOJyDDDUa+ZcHGSuN8U
         aBEtwwsqyvRMQYV48PylejbTF58BwpHLH8dB4ykON5jFbhTZMs6u5S/mI4GcYNAlu4mb
         HJgRbag5N7jFKdIsxESIvKEXLb1lserTdpURXfYnTaJwTUWOpfXFaFVow2gbZqoPC5MA
         f7Fy6HAu5gZo8PTvYdaoryKJzIjXM01u+qgyYDutwIrWInWhmNkNWQ0Bhm32w1nnoDwL
         pozw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699951205; x=1700556005; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fUzXZ80kXz2yYmJBdSxtKDDGUZclLamfgYCcie/5pQ8=;
        b=FrQvlcXT9FJSSEEEhF+YlV6bJIN9mWRzU/LLWSA6Nnhf//t1M1HSnYKXZS360DZiau
         2G+ZuDi/p9vG+mvNVpRW9BpwF3XYmsXut0VoVKAjRA39HqtDcXq/9l19P3/Kg/pbWyss
         KBGw6PySvvxoeFHw17qF7irX+aZ0H4BUocBMl5c3XRiEpEzkBocluaU+Sy7bY1VpLuAq
         AFXXyK9C+m9fEDxwO3gMIVX5PHy4iToYhxHn3SWVIqNrW8/uqqVFO354pFcneFiqm6RT
         Iz+7SZykS+I6c0QGH/2cF+nvxDyfL3NunDVYf/ZCmWh2t2AdwtqI3Sz2R3R8WWCxyhHs
         4p2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699951205; x=1700556005;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fUzXZ80kXz2yYmJBdSxtKDDGUZclLamfgYCcie/5pQ8=;
        b=VxfidF+10agabQyszEIT2i+Yv/Bh6iqi8qnqSpUU9UNdcn6YCaYA5ghH6LiKQU+m2G
         1khZS4m95XGQ62DPoGKfwlFwopjMN6D4QhJ4vj8/FkqZrUO920uq9r8sGxajHNCy3oXV
         L9fsxcoHTT1jMRx3WUkkbG/gx5ZI5fV72T9Z8hPk5KApEIDHtEG2rzqMLuJUo934YuF+
         xDxdcvy5smK9LP8HFRCe5iT3nJyHqdDog2u4/2VhsJICczS3HnmdmwTr4Xhp+UQRRpyE
         ry+Vb+PYsuzm4x7HZJadltOyVZYRjllx30ADY7yO/6gJVykfzvvNqABxPgvw8r67+ofL
         fFDw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YxXPEjDVo80Er5paizROfPMxxUJrPQpgfbUa23H3kOYithBEWjm
	/wulXUctRF6q9Bmfp+L6i5s=
X-Google-Smtp-Source: AGHT+IFHJbSsQ5A4EBdGX3OlSYEfvvXxMLqOZPqgIdgESrzvNVRjBlShjjO8u5//tvo3+U35+bne9Q==
X-Received: by 2002:a25:c0c9:0:b0:d9b:4a28:f66 with SMTP id c192-20020a25c0c9000000b00d9b4a280f66mr7580721ybf.53.1699951204972;
        Tue, 14 Nov 2023 00:40:04 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5b:d4b:0:b0:daf:686b:ae6b with SMTP id f11-20020a5b0d4b000000b00daf686bae6bls1645827ybr.2.-pod-prod-01-us;
 Tue, 14 Nov 2023 00:40:03 -0800 (PST)
X-Received: by 2002:a25:b097:0:b0:d9a:efcc:42af with SMTP id f23-20020a25b097000000b00d9aefcc42afmr202863ybj.2.1699951203704;
        Tue, 14 Nov 2023 00:40:03 -0800 (PST)
Date: Tue, 14 Nov 2023 00:40:03 -0800 (PST)
From: xin zhang <zhangxin6483@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <89d7ee90-8781-4db0-ad76-b045f1844eb2n@googlegroups.com>
Subject: jailhouse enable non-root linux
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_76200_836118976.1699951203059"
X-Original-Sender: zhangxin6483@gmail.com
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

------=_Part_76200_836118976.1699951203059
Content-Type: multipart/alternative; 
	boundary="----=_Part_76201_1821668200.1699951203059"

------=_Part_76201_1821668200.1699951203059
Content-Type: text/plain; charset="UTF-8"

What is the difference between the kernel image used by Jailhouse to start 
non root Linux and a regular image? Do you need to change the 
configuration? Can the directly compiled kernel image be used? Which kernel 
image is used? Image or vmlinuz or something else? Can you give an example?

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/89d7ee90-8781-4db0-ad76-b045f1844eb2n%40googlegroups.com.

------=_Part_76201_1821668200.1699951203059
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What is the difference between the kernel image used by Jailhouse to start =
non root Linux and a regular image? Do you need to change the configuration=
? Can the directly compiled kernel image be used? Which kernel image is use=
d? Image or vmlinuz or something else? Can you give an example?<br />

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/89d7ee90-8781-4db0-ad76-b045f1844eb2n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/89d7ee90-8781-4db0-ad76-b045f1844eb2n%40googlegroups.co=
m</a>.<br />

------=_Part_76201_1821668200.1699951203059--

------=_Part_76200_836118976.1699951203059--
