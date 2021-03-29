Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB3OZQ2BQMGQEO4YUKVQ@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qk1-x73e.google.com (mail-qk1-x73e.google.com [IPv6:2607:f8b0:4864:20::73e])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ED334CE03
	for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Mar 2021 12:33:19 +0200 (CEST)
Received: by mail-qk1-x73e.google.com with SMTP id 130sf11934419qkm.0
        for <lists+jailhouse-dev@lfdr.de>; Mon, 29 Mar 2021 03:33:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=iy5M0rAzjGYusQN26Iq6I3W3Zh6ni8J7LJnhvz5cqSs=;
        b=LsfAQsr7F+OGOJGUG8WNoGhfLsXI0Fcyql3yCrz60aB4u/DtgX+AbbJf4GJdWDtnlo
         GvA+Fgcp039iOljh3GBV2WkEiCksg0PlumX90lKy93O8Z8mA0sAtzQCjAExUOFL4UI18
         u9NYh4umgRQTaM4HfMrG04ZTE2/b1Zlt9t7DZLxplaTPMcUIeXQnC4QknNelsZc59KVf
         cQ6jCgbIo6+SkTJ1XCAC63i8/PYosiiecuxnOVinf8LbqJKs+wfp8zt01Kmz4tdow2Nd
         u7KQXKrklsGgKS+LAF0bP9Hom90CvUfvlhfSTAMDi6WlrWFvxMBG6nm9KFBpgqNHmEKw
         xvwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iy5M0rAzjGYusQN26Iq6I3W3Zh6ni8J7LJnhvz5cqSs=;
        b=IUCgaVqkokUsYYMZAmmZKtU92JM8du4zsoA4FRLOTKkG/njTcdlYk37xGQzCkHUfEY
         mjU5kgp3suj4Nzf4sN/zPVEgWJp3CEkIrh/IrccpBjSr4n2rlJ2OXZ7AX7vpwbSwlVor
         6LFP1LGKNaOupWuDY7bocBEot0N44LYVwpzN9aHCR961IIAnTNCajvqACU47NPfHRWnt
         LuV17YcEJonReOBg0bZ6aWo40q2yMm26QO9+fRX8yxXSrmqG77nuTHzukKOh/5t2JTNT
         mdxd5iRs9IncerNlRu3v6gRCD6KUMr7dQ+PbeCkwfPChvWBhAeR8+2sCMXiUT6VqMa6C
         djnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=iy5M0rAzjGYusQN26Iq6I3W3Zh6ni8J7LJnhvz5cqSs=;
        b=jA4fmBLAZGkc5fAzt7t3f2Kj7a/r/RHZ2m28eDdgYaqPDYyCFZK/jq55ID97xBgNfH
         2wfSK+EQt/P6KFP8LTTH0R0Akifitmokwr9XBn35cr6egsN7hXC3bKxVoPLEG0L08yWK
         CoRjHHP+BIfcWBzGgZ7H9LgFLypLTIQ17Hyl3uviCRgb415i4hEe7Y3b8qDlNLe6zIB5
         kz94kV8iSbyUEJuXFpdb3HQOd3FncADbUXEot1Hu1bfMl/wf5mVXQ2sSTRzSWFK+NIYo
         tWb83mxoZLAyrk5vlKUrF5Dlwmt8l6TZjXjI8NsNFchUCWYaK0cRUAL7tdNOF0xjE1kb
         FXFw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM530S5mQifCnUMMRf0Txs9w9qWWNodbmyIiOWHB+Vh7nysuNX212E
	CqHiABNnXRUW/mHW9ONoyXk=
X-Google-Smtp-Source: ABdhPJx2BME23aYNfO4x1eMokvHlzaO5JCAEOXwimRUHo+Dw2zQ5OlqGhRK0ooyrSR7gcXpGuQ4DFQ==
X-Received: by 2002:a37:a8d3:: with SMTP id r202mr25557174qke.383.1617013997640;
        Mon, 29 Mar 2021 03:33:17 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:620a:991:: with SMTP id x17ls8324975qkx.2.gmail; Mon, 29
 Mar 2021 03:33:17 -0700 (PDT)
X-Received: by 2002:a37:9b01:: with SMTP id d1mr23458800qke.337.1617013997136;
        Mon, 29 Mar 2021 03:33:17 -0700 (PDT)
Date: Mon, 29 Mar 2021 03:33:16 -0700 (PDT)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <ef3ebe2e-a55e-4166-8d6c-0fbad03f0b54n@googlegroups.com>
Subject: how to  partation  GPIO  into non-root cell in Raspberry Pi 4B ?
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_2470_872635423.1617013996597"
X-Original-Sender: v6543210@gmail.com
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

------=_Part_2470_872635423.1617013996597
Content-Type: multipart/alternative; 
	boundary="----=_Part_2471_1930288638.1617013996597"

------=_Part_2471_1930288638.1617013996597
Content-Type: text/plain; charset="UTF-8"

jailhouse-images  is  a good demo.
It can run very good in  rpi4.
But how to  use GPIO  in non-root cell .
Can some one  help me ?  Thanks very much!

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/ef3ebe2e-a55e-4166-8d6c-0fbad03f0b54n%40googlegroups.com.

------=_Part_2471_1930288638.1617013996597
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

jailhouse-images&nbsp; is&nbsp; a good demo.<div>It can run very good in&nb=
sp; rpi4.</div><div>But how to&nbsp; use GPIO&nbsp; in non-root cell .</div=
><div>Can some one&nbsp; help me ?&nbsp; Thanks very much!<br><div><br></di=
v></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/ef3ebe2e-a55e-4166-8d6c-0fbad03f0b54n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/ef3ebe2e-a55e-4166-8d6c-0fbad03f0b54n%40googlegroups.co=
m</a>.<br />

------=_Part_2471_1930288638.1617013996597--

------=_Part_2470_872635423.1617013996597--
