Return-Path: <jailhouse-dev+bncBD6ZDC4GXENBB6OFYCVQMGQE7364Y3A@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-ot1-x33d.google.com (mail-ot1-x33d.google.com [IPv6:2607:f8b0:4864:20::33d])
	by mail.lfdr.de (Postfix) with ESMTPS id 41E4180683B
	for <lists+jailhouse-dev@lfdr.de>; Wed,  6 Dec 2023 08:30:03 +0100 (CET)
Received: by mail-ot1-x33d.google.com with SMTP id 46e09a7af769-6d99fe1a67fsf4257559a34.0
        for <lists+jailhouse-dev@lfdr.de>; Tue, 05 Dec 2023 23:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20230601; t=1701847802; x=1702452602; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mo71VfiXHtGm5YOdgbftffsex7PMD3eUZvLnzOC0Z1Y=;
        b=gOjuuU0lmRTU1RITgSq+G7mV0Cx7TsvfG+rwTITQoX/2QotVOb8Ez7ENCFMTnGMPSm
         j36f9BRZHjelePGzKXHf50Dxw1DU6m7bKmItvtlC3kswlklOAQ6jLqqA+Al3DuwKSLfN
         u7z8KmA5vXXJ9ZMkhu6067gHp7BUKdO8AB6Drrv6y7++RLHvBvZLeAXv2AGMKPm3/InH
         rqRfLAt9L8YyxlpmIFGlFRWV+ogi8UMNI5p1paSSeys2SnlvadOE93rQ2dfjPleYEpRN
         CWumUmogBccw45eUzeX6FJK7PTYKSuydjAEKoDwpf6TiwQHJjrPnijPADJDgPTYe/1yn
         5U/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701847802; x=1702452602; darn=lfdr.de;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mo71VfiXHtGm5YOdgbftffsex7PMD3eUZvLnzOC0Z1Y=;
        b=ebO0oVPhtfJzXq6OYf0bl7OYeQHcgci4sH01Fr0G7q64sBH5Lm3br2+zXjmjgAEuKA
         8iTZomtsUBorfij9bQE4u6AZxmRKy7bhF4WGjyAAlxqfAn+FcEOjrCFCmLk6uIwlbF7e
         JgiqKCZ2OU7euB8aefz6Fl8foCpz+lqHEQDeZSJ/PtAdT9REb+2sPKq+MnEZ+oz4YqZM
         HjWVWAczAiFRkgfqD/Z4BrkWIXSijaTpDZ/lmNS6Ou2Q1LF4/w+MvhR8LgafAWM9J3Xm
         hyUxhP5jz+Zwtz3bhKQqoFuyaYaOJNDogt+FX6TFobYJcaAZ8km0RgvztUM1bAcDTAsW
         DX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701847802; x=1702452602;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-beenthere:x-gm-message-state:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mo71VfiXHtGm5YOdgbftffsex7PMD3eUZvLnzOC0Z1Y=;
        b=ByntQTggmx76xu6Yj5BeOYxsvkGGDmo0YqMkuSLwVvTttwzW7tfgHgk7f3+3Lu6Fpx
         DS6gEiWvlZb8NZ9yqKhmeb+M9DzPhoMDbifSiP1xguztQmmufnEHMg5JsUtDYDIev2OT
         GKjcLq7g6U8tqEMpSwTZijbg7BkH+v+4RdM+PXlNBFAVwpZby/hQZIrORsKE8yd8ifLR
         7SnM/kIRh3TSsZcCNWWiZJreGXKEHeJnLtgGEOoa1q/QJjyMnidS1s5gwvfE+GTlD1E0
         Zwop0/+avrW38eoy2LYyVey3pfdzURtI02Sa3+x2zJfpdaW8Yemht7rDvrDU2nO+LWqf
         NTJA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOJu0YzG/S92iUcm1kjtazTnLaJeha5DrJR31xK+9ABNsX957pC8GFGq
	ve6123AgYV3Mhe2zYks4HSI=
X-Google-Smtp-Source: AGHT+IFkWDcs9HbcfRtrXxK6YLqdc2Rqc25J0FaoesGgFTeduzMdxjZViOw3BY6u3k2crneoHTsoMA==
X-Received: by 2002:a05:6830:3696:b0:6d8:7602:97d1 with SMTP id bk22-20020a056830369600b006d8760297d1mr627359otb.44.1701847801861;
        Tue, 05 Dec 2023 23:30:01 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:6820:508:b0:58d:582d:7ff1 with SMTP id
 m8-20020a056820050800b0058d582d7ff1ls438976ooj.0.-pod-prod-04-us; Tue, 05 Dec
 2023 23:30:01 -0800 (PST)
X-Received: by 2002:a9d:51c4:0:b0:6d8:7635:8cd6 with SMTP id d4-20020a9d51c4000000b006d876358cd6mr244466oth.7.1701847800745;
        Tue, 05 Dec 2023 23:30:00 -0800 (PST)
Date: Tue, 5 Dec 2023 23:30:00 -0800 (PST)
From: xin zhang <zhangxin6483@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <03a70bda-c021-43cb-9d7a-1365cd123c61n@googlegroups.com>
Subject: Jailhouse on Nvidia Jetson Xavier NX Series
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_15646_498369512.1701847800030"
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

------=_Part_15646_498369512.1701847800030
Content-Type: multipart/alternative; 
	boundary="----=_Part_15647_1337719388.1701847800030"

------=_Part_15647_1337719388.1701847800030
Content-Type: text/plain; charset="UTF-8"

Hi,all
May I ask if anyone has used Jailhouse on Nvidia Jetson Xavier NX Series? 
Does it support it? Can you provide a configuration file for reference?

tks.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/03a70bda-c021-43cb-9d7a-1365cd123c61n%40googlegroups.com.

------=_Part_15647_1337719388.1701847800030
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,all<div>May I ask if anyone has used Jailhouse on Nvidia Jetson Xavier N=
X Series? Does it support it? Can you provide a configuration file for refe=
rence?<br /></div><div><br /></div><div>tks.</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/03a70bda-c021-43cb-9d7a-1365cd123c61n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/03a70bda-c021-43cb-9d7a-1365cd123c61n%40googlegroups.co=
m</a>.<br />

------=_Part_15647_1337719388.1701847800030--

------=_Part_15646_498369512.1701847800030--
