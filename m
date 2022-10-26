Return-Path: <jailhouse-dev+bncBCVZLPHLVQKRBNNZ4WNAMGQEY5L3XCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x839.google.com (mail-qt1-x839.google.com [IPv6:2607:f8b0:4864:20::839])
	by mail.lfdr.de (Postfix) with ESMTPS id E91FD60E555
	for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Oct 2022 18:13:42 +0200 (CEST)
Received: by mail-qt1-x839.google.com with SMTP id fz10-20020a05622a5a8a00b003a4f466998csf722036qtb.16
        for <lists+jailhouse-dev@lfdr.de>; Wed, 26 Oct 2022 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WS5xMR1bng7abuyp4Uv+5oA5M5yh/YOa6rertWpJ3rs=;
        b=TA9k2jZ+TZLYHjSdlQWNumpA0eZWb7kiy5kJiUzEaH12DHzlorJ3ZUBmSwnXiN2b6K
         vAD/5NZFawNcg51Pp3zVIkMgNOrAKZyLgG0I7Gf/chQzx4xPT5raP0eiuaYYHzrGrrY2
         rXB3qoqO8KQ6wCGDV2SA3oW7c7zeQ+5bZoHPRk7eMt+NLpkYC8I935gqxggPGC59InwQ
         UyWwStOHSdPmJX4tlam+K8RU3BUiN72xDnpvERZEWSmh3Ge4Cz1xCT0Jp+pK9rD7hn1Y
         RVce11UL4AodGo3BZB2KWP22fjjszPPpHAJAEFUa9ey/FcrGjQOAwX9FgLy9c8BBIHLl
         xSSg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS5xMR1bng7abuyp4Uv+5oA5M5yh/YOa6rertWpJ3rs=;
        b=TEOjcNuBMWJWIxLlCUa0l4MkdosxGvRhPu81PMx2qzprc0f4vfl+Ro4viwWYZ5Iy1Z
         ++ysJ8YDUUKg4KX/2k6xuoYc3ohhNCcatf6SQ83TBHDr5j50ALTDQ9imBUycG7dA771T
         cmk9iltjaIjgtxFsn47l0kKR867dNHXZ2ddPGgVcukcbb2S5bY8mBaVzoxNVHG2EJviq
         gSKe1hi+3NPggfXlqaPiBWGd++yOG7oZqeyx9Sq71KJZ6qTO1ZnegDbDi8RzVJIjOZp2
         qJS1S9ROe8HgTZs1fFrIdtxFVdeJu1HZeNDTeefR3ry8UOLQ+MVB1I/kguncZEechT45
         w23Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WS5xMR1bng7abuyp4Uv+5oA5M5yh/YOa6rertWpJ3rs=;
        b=wXQQCITNUwOaphmsnFSDzEVgp6Ov3Jj9CRkRXDCAK/cpyUiOxooBAHGO5Z5srE+UcC
         hQjFg4Kc5iBPVMa1/oT7+uWNYDTKo+xv2R6A/Xx7GXNETmskbczIp7I6PLct1C5KVDuz
         SJlf0RhRn1nFh9MSW6tyo9vhZYJqm7jYPGLOxfBngcgcrpykI/wBHVvKLUdBAB5nUmKJ
         1AaS+5DZTvydcg3rEeLMIAk4zuD+B5RFJoge6gfyrIAcH8NZJppzsWmbcs2gGZHEZMRZ
         MXF9McnN8G0zCBfG+P+hWFp5mfMxM0RhOVd8tgNcG+fWmEOphgeh6tRABLigcmTplrjl
         LFWg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ACrzQf0hnYzgCVg11xW+48QamaApSNAcf9+kNBSkFm9xVcqayopbnay1
	KCG5D32/R+tbe4qJfHi6+UY=
X-Google-Smtp-Source: AMsMyM66SVkHTWgrqUoz7eJsdd1YHCHCD68/mymTItCtOy1QaIls9mfO5NzHruK2O7xwB/GeOyumFA==
X-Received: by 2002:a05:622a:389:b0:39c:bca4:587e with SMTP id j9-20020a05622a038900b0039cbca4587emr37996871qtx.491.1666800821745;
        Wed, 26 Oct 2022 09:13:41 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ae9:f701:0:b0:6f4:ee4f:fd40 with SMTP id s1-20020ae9f701000000b006f4ee4ffd40ls2761508qkg.5.-pod-prod-gmail;
 Wed, 26 Oct 2022 09:13:41 -0700 (PDT)
X-Received: by 2002:a05:620a:171f:b0:6ee:e6d3:7e8d with SMTP id az31-20020a05620a171f00b006eee6d37e8dmr30635769qkb.298.1666800820717;
        Wed, 26 Oct 2022 09:13:40 -0700 (PDT)
Date: Wed, 26 Oct 2022 09:13:40 -0700 (PDT)
From: Tim Biernat <timbiernat@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <480bddd1-57be-4f84-a285-dcb917277ecdn@googlegroups.com>
Subject: NXP LS1043
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_964_879597680.1666800820034"
X-Original-Sender: timbiernat@gmail.com
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

------=_Part_964_879597680.1666800820034
Content-Type: multipart/alternative; 
	boundary="----=_Part_965_1870652837.1666800820034"

------=_Part_965_1870652837.1666800820034
Content-Type: text/plain; charset="UTF-8"

Can someone speak to (or point me in the right direction) to the state of 
current support for this board? I see some config support under arm64.

Thanks in advance,
Tim B

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/480bddd1-57be-4f84-a285-dcb917277ecdn%40googlegroups.com.

------=_Part_965_1870652837.1666800820034
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can someone speak to (or point me in the right direction) to the state of c=
urrent support for this board? I see some config support under arm64.<div><=
br></div><div>Thanks in advance,<br>Tim B</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/480bddd1-57be-4f84-a285-dcb917277ecdn%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/480bddd1-57be-4f84-a285-dcb917277ecdn%40googlegroups.co=
m</a>.<br />

------=_Part_965_1870652837.1666800820034--

------=_Part_964_879597680.1666800820034--
