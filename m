Return-Path: <jailhouse-dev+bncBDDNLV6S7AOBB7PIZT7QKGQEH2CFO4I@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-wr1-x439.google.com (mail-wr1-x439.google.com [IPv6:2a00:1450:4864:20::439])
	by mail.lfdr.de (Postfix) with ESMTPS id 882B22E9889
	for <lists+jailhouse-dev@lfdr.de>; Mon,  4 Jan 2021 16:30:06 +0100 (CET)
Received: by mail-wr1-x439.google.com with SMTP id r8sf13358222wro.22
        for <lists+jailhouse-dev@lfdr.de>; Mon, 04 Jan 2021 07:30:06 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1609774206; cv=pass;
        d=google.com; s=arc-20160816;
        b=S6fuX46boZKK6CSYo/VtFgVAoCLiFgDy7hgvdMdfis1eaPWeu2d4LmwJEQyd4mMfXD
         93O/rHBj1/Vz5N5g/SKPeiax3Y7eZyobIzefzl+bc43k7P1O34al7e77LWq+JObp3lCu
         cwJNpt4hS6KdnZGym5ortlXK2n4IUJh+HdS/fZrjsV22nKmenTdzPm8e2iO8b+UI0iE0
         GE45xtlrmvmv+3XLW9bCJIU29Z4w4ZSoosYZvk7EDGdEjsBXIkGnXNK3ZOg3wzE4V92d
         blJc4wXX+CuhTX8QiURW1l0IhBfFS7geKCLbaN6QbzjaXY4mnpvIb8qlFCUm6lisWtSM
         vKNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:sender:dkim-signature;
        bh=/4Krpw3tVhavX6kk/F9XtlymHAt+M2IR2d9cmmFHSG4=;
        b=qhPXJwpwlvIDfoca86Y0vmWlNQWUV9fThrNep9cXOwkrhMq/TllzgDjm6bc/10yNLW
         +C/0sQU3FNxJRnqMPOYXMcxGeNxI9zvSXLATfqxC4SHLzF5i77CFbZ8EByaun7sNpujL
         ZEZhsdN0SWnKCa+/N36yfwXl1pMZmzqFSWpYRiQKPCnkUeCwu9wYWgpan5LAMyQsdvXX
         32iTOWE81u5mAtb2B2Zdcf4HIblXCyOHgN2UdSs6IqKZCfPNWlgyKn6RHx/T7pOAYN+w
         AKz2RM7Ub61X8KQ208WjxbhdRqjQzlLJ6ZxdKRNBTOeCiWd13EUmNxIIyn6Bc4nRrqL6
         uDCw==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=K9dpC02f;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:from:to:subject:date:message-id:in-reply-to:references
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/4Krpw3tVhavX6kk/F9XtlymHAt+M2IR2d9cmmFHSG4=;
        b=E2LkewNwcOptdwH8E7t8gNJk3u+N/zxrpKuwyDZjFtoBWjr7CjeYH8U2d25iGpahPI
         DaSARbxtnH8REewyUAHAzdaExBPYcRP0VhUiKfu7ON9w+QxrLZmT1Dk4JMqUY9A5rTqn
         RMA0QrOPtH+/Xvx0qySm1OtmLEOjN3jYMJ7KAsLdVtF++dzrvMKMnESQvp3/Dmox+QXi
         kkUoE2dcj+JZ4V7IMU0PyTmzySeb0us8sQuaoTN2x7xismGO4N6ZbVhFvalZK5QvUcuZ
         +ASUYyzSCSADTbMSh/i3MIKTSraG2JmprmkXFp9g+BEP2KbNMcLN61g+N0kI4PL/lEw/
         UNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:from:to:subject:date:message-id
         :in-reply-to:references:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=/4Krpw3tVhavX6kk/F9XtlymHAt+M2IR2d9cmmFHSG4=;
        b=kwwg4fAehT+o/RMzH0XMgTZzLU/MAZkuP7gje5tSLFjWLfwIcnlwItdQ2z2vjHuocK
         uoVWjxe3Xe7MIfs1soC8/2J2a5lX5NnfNzP1bX+8HeE9ZsdZLzcBti9TYrz8LGZj7q91
         FjsQP8mhG1YBO1409wdrpWrr5r2g/bqc4LnGVvB/BnKpJXtFk1LcuAczwbwTD5bizCbO
         9tkW3CDvlrtG/PYqjD6OQKraJl3xy8X93aqtFuYClv8TjJwoxQp2J1cHX8jQA7OWODqa
         VUjOYdw85tLUBKwB8gdWugwvjp3jCEJK2FeIInUPdOGX6rfgNN2I/O8y9WU6UJBzvVqJ
         40tA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532akKPQVxXU1OxFz6StS6Of96GNNnsAoPhC4cbQ+tUTrZKrJ6VN
	44FBJaYlA37OQMEow/hSafU=
X-Google-Smtp-Source: ABdhPJx/r9I/ZgaMYXstN+yyKTkX0sw+yYOjYLu00Sg7ZaLxS75PKjae7fsmh2eLm/lonCPsUwU0uQ==
X-Received: by 2002:adf:b78d:: with SMTP id s13mr81569612wre.344.1609774206365;
        Mon, 04 Jan 2021 07:30:06 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a5d:66c5:: with SMTP id k5ls860133wrw.3.gmail; Mon, 04 Jan
 2021 07:30:05 -0800 (PST)
X-Received: by 2002:adf:f74e:: with SMTP id z14mr83225273wrp.146.1609774205358;
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609774205; cv=none;
        d=google.com; s=arc-20160816;
        b=QzHohFwOETc/GY9fwRAsq+CtrxOsRHZYWVf5jgCZLRi3CFfUvVV4l2tpu81o5SHb/5
         q8+LQVOP+f8Rp0z3Kj26EWJiMS583iPVshLfLC0/TB7jCLbmnQGFmLfAScuBZeIy7r/B
         AGfo289Y7IJnPxRQrsx7vE+f/2/Pl3iMSLaWlUXdo75q/CVLTsOb7RrPAEN8gJ53C3tO
         5DYbdvZNWrHTDCa0wAWeiXXlE1VHNEtVlD1mbGO9LtovACP3aFOpUWmTxmyBJgVOd5UP
         XEEOpx927Op12TIkBkOksSVL67oFe9KxeGQRnVFFIUYLrzLP0ihKQykt67ngQ9iPbfcp
         Risw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:dkim-signature;
        bh=e14a185T58wghQNu84rTOK7OvXMrPONpV0acdUTcTZ4=;
        b=memjDc/UkJFaM1sJhZuawHs7GwF5XxbtxQ2sxq5N7pYe45n5cflYJ5qdQV3tMl1Vr+
         dUoX8GGboFqeKkZD1YVsVDoJzNmfis8QboYUIWq3GCD9Jl2skNQrxrDkhgFif1SBYrLc
         8VUcgWExQVruvepbIMcpzG2vip7iU7bKDyhJuRmH0jAkbKbPUhAlLMrVE/Q8bQqmjNkr
         eg5MGtB4mkZVeaOZYW/wkoe9mgOCSShpFS5HYYqpB2vJSWQOoPjeqTmGFKuxc0YV9E2q
         OgQSm4IYEu2zjTrFzNpoPPJ1uNPK338h766pz/q2ghCOlmZE/hQrFvQ1b+Ifmshv5EQv
         ZDAA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@web.de header.s=dbaedf251592 header.b=K9dpC02f;
       spf=pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) smtp.mailfrom=jan.kiszka@web.de;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=web.de
Received: from mout.web.de (mout.web.de. [217.72.192.78])
        by gmr-mx.google.com with ESMTPS id n8si1983674wrr.0.2021.01.04.07.30.05
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 07:30:05 -0800 (PST)
Received-SPF: pass (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as permitted sender) client-ip=217.72.192.78;
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from md1f2u6c.ww002.siemens.net ([88.215.87.53]) by smtp.web.de
 (mrweb105 [213.165.67.124]) with ESMTPSA (Nemesis) id
 1MNwfK-1kchzY3yhM-00OMtw for <jailhouse-dev@googlegroups.com>; Mon, 04 Jan
 2021 16:30:05 +0100
From: Jan Kiszka <jan.kiszka@web.de>
To: jailhouse-dev@googlegroups.com
Subject: [PATCH v2 4/9] inmates: arm: Enforce soft-float ABI
Date: Mon,  4 Jan 2021 16:29:54 +0100
Message-Id: <1c3a9508644c5f1d9fd5d6d0cdc8caf28c90b35c.1609774199.git.jan.kiszka@web.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1609774198.git.jan.kiszka@web.de>
References: <cover.1609774198.git.jan.kiszka@web.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qt7GObqHjqCpQaNx2Ydm4LYM+BQoqZs+LHMmmawjycsxXTAktxc
 hL9NY+5jxdemcAp9U7OGcrCP0ZzTh6fnK4OXc6TX+RaT/+lu1meE60tFRlcfUsTvDBMXn1I
 Nc2N5Oer3xaxIMiBBsIrVUOshpvH6wtHKEY+ATBV0A0CFcqivrOhs4C13ieO/wCy9MHHLuF
 W65gEBqiikTygK8TGJorw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:JXSsAp5KlxM=:TjBIM/BkCn96qEZBVawYNX
 4IwE5DcHoouoZ0bkgr1ASoZTuZX6QpF85Ud03UlfFIg+y5n9VkyRPyA7yojgEzsrBlXtywPGk
 RHn2dafw2K/9zHPg8N2Gz82nrWPj22EP6GQzIEiCh52fk7UFBYXGNFMiv9PtMkihErENHnwAp
 pXGIveB8/FaJTYRwbfJVD3oT73+Csi7KJF4xAQdPbRYhdJc6IBDhttqSNi3n3/Oj9z8n4PAvJ
 3u22sJqLrxtRy67qo+cxKFCBkg2pcNcMbFzuIExKGzxpuyNW91T25tZcoX4ZIL1tMRytWi3FS
 KlgBUWRrzjas6fbnEwHr6AQXM6SsP0CETcpgvqcDh7hCQDfBpxZjjZ+/J+4bVCczTRiPFrJU7
 GwkJpYDLl66OW3CJP26l0eeEkjMoEcvqTkuAQ3u6JpkJ+Ex5U/31AyR6nEdB5RIj17hmsa/tg
 OwG/O3iO32jWXIM27nMEzZUrGJ8khh8nW8lO1IA/zsM2+FvOdT4OzCUycKjfu9JsbruVJxrm6
 Qkams5pkIjwb/P903zrBqqtu0PrGe49coE96TvmNRoQ1AsJfV8rK+9ddjht3f1fnjeQln7SMf
 X9hlBr7y7JWofEi31Z9HmLFYlLY3JUSN0ap/80C9JCk+fpLZ59EWw8MPlKy9qlfJ6v2u2JhnX
 kKHgjQo/uP5ysEZWjWdMXL4HQeiwVpKj3TUAWgg8xn0AjvgItVfKS+9z7talVuAxz8kFcxflW
 fPBvR5W3hLpgzjwiUI0frl3dCyFH5XA8rQ63TyfW8i8NrkzbjV2OrwLUWQqMk7CvAgUhv5zsl
 f0KyqvIjQGuplJDCDS9LvNezCwoHSDvRfekURnn3HgNy7yeROdR7uPsHW0E13k7YrBYAjq7jK
 rVxKVHUcsxQ462gid8AQ==
X-Original-Sender: jan.kiszka@web.de
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@web.de header.s=dbaedf251592 header.b=K9dpC02f;       spf=pass
 (google.com: domain of jan.kiszka@web.de designates 217.72.192.78 as
 permitted sender) smtp.mailfrom=jan.kiszka@web.de;       dmarc=pass (p=NONE
 sp=NONE dis=NONE) header.from=web.de
Content-Type: text/plain; charset="UTF-8"
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

From: Jan Kiszka <jan.kiszka@siemens.com>

Analogously to the hypervisor core: Our inmates do not set up vector
extensions, thus stumble if the compiler generates corresponding code.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 inmates/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/inmates/Makefile b/inmates/Makefile
index a4ab7903..b4d4366c 100644
--- a/inmates/Makefile
+++ b/inmates/Makefile
@@ -32,8 +32,8 @@ ifneq ($(wildcard $(INC_CONFIG_H)),)
 KBUILD_CFLAGS += -include $(INC_CONFIG_H)
 endif
 ifeq ($(SRCARCH),arm)
-KBUILD_CFLAGS += -march=armv7ve
-KBUILD_AFLAGS += -march=armv7ve
+KBUILD_CFLAGS += -march=armv7ve -msoft-float
+KBUILD_AFLAGS += -march=armv7ve -msoft-float
 endif

 OBJCOPYFLAGS := -O binary --remove-section=.note.gnu.property
--
2.26.2

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/1c3a9508644c5f1d9fd5d6d0cdc8caf28c90b35c.1609774199.git.jan.kiszka%40web.de.
