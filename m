Return-Path: <jailhouse-dev+bncBCBJJVUE3MMRBDE5ZGNQMGQEWCOVCTA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qv1-xf3f.google.com (mail-qv1-xf3f.google.com [IPv6:2607:f8b0:4864:20::f3f])
	by mail.lfdr.de (Postfix) with ESMTPS id E06E8628241
	for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Nov 2022 15:19:57 +0100 (CET)
Received: by mail-qv1-xf3f.google.com with SMTP id nn2-20020a056214358200b004bb7bc3dfdcsf8579267qvb.23
        for <lists+jailhouse-dev@lfdr.de>; Mon, 14 Nov 2022 06:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cBWfXmrOaaFRH/qdhfrQV4Sz2ABCM+A/BoF9nP/IbCI=;
        b=bDtDy6zb21mXhr7IVKtb2Cl/ymhgu5zM+2deq+IJSF+0bxc2syg/LqnueqtlcQjuTQ
         QskjAlpDnICdXvUiiDssVAijEdxK/RyMfb14bds1R8YOw0OfWhJDC0HzTqBcA0QpQm5b
         tfiSo6N02TPRH4bHwoREPmLXO2uiEu06ZlmCYT4UrK8++lvFhIocKaDVkhvip8h9zKYo
         JKO1HKDpuvG87DeoT0T/z68BXsOUFJP0OTaPH8lHjzCxb4opTXcZ9f3DsFti/j27ZeBi
         qcqOc0Tl1Pla8o78qCyTW5TazUqgpR7a/tD99w7gYX0ACn9UP5KxmDY791rpZCIKVbN3
         +J+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBWfXmrOaaFRH/qdhfrQV4Sz2ABCM+A/BoF9nP/IbCI=;
        b=AyesBZDn9IMZtUpOsYMcqKZ5WAAVe+ma69rMdfEiz0ctc6jnA2otkyHtyuJgn07M6B
         hZgE3x7vwCnonBaQuV+FyrtWdgKvH1QHOdA/K0vKMZAmvS+wEHFQ1ER+EW3q+mqPY3pE
         Hok7O2c6N5CvDuf7K2ocFwNOqEIu5/FAAQo5WMOxIrb97U4u419o1/coSyD+Rc+dGC/A
         m/wf4QePlaUZ/ISDLKWXsVCTIsOn1eodhvSGfw10iVyf9sw8ZbScx9RWnmiR9QDqi2SV
         GA0mwVdmuVr//qXiMbrHcbMBipTpZhK1nDJ7BJlJA+rbcEOuBwCLzihZ7A+sRHYDDCjM
         hd5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cBWfXmrOaaFRH/qdhfrQV4Sz2ABCM+A/BoF9nP/IbCI=;
        b=0O6IOk+IM+vosNXZUrLONBB1qcIxGtoqpUtnzHUPLRlCOFSjH12jVR3Qw60J4q2azP
         RFVbubFOXlDB1QnkPfPsLXOnzX8+v/mkEb/G4xOw+hMVH2/lgzveifF9mlHV5q68/bg5
         EMYQ72UbnzHn6mSufRalX9M/hynHk8Jw8wSpwMTnuo++FjbJaaYhAIGyE41zG6pT/J15
         Fcd6R8bfFj6pNY5qfx7+LelW/pQJaG7tZzSUBTuLKbWPYQtl1zj8Lvaxy2rDu9xKsutS
         3v0fLDpy4lkJMLwNB8/2/oCqyu92o2aAyZ2CLeQE/riiZkFezXSXOpn+37IdYbCKXDje
         YLzQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: ANoB5pn5pT0tk3BhncXmca0P0Yv4oHuImaEBmN76jRmtilk4zfY8e4mI
	V6YDNLe8JZz9yurH2fHU4RM=
X-Google-Smtp-Source: AA0mqf7BzAY3gtVmN22KREPRTpV8ygiNolJ460lr0jxqoC7ixMo0uWtO9XmWVefjRiiJnrogtvCSAg==
X-Received: by 2002:ae9:e705:0:b0:6f8:aafe:27e7 with SMTP id m5-20020ae9e705000000b006f8aafe27e7mr11091582qka.590.1668435596576;
        Mon, 14 Nov 2022 06:19:56 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a0c:f445:0:b0:4b9:d85c:f017 with SMTP id h5-20020a0cf445000000b004b9d85cf017ls5275425qvm.11.-pod-prod-gmail;
 Mon, 14 Nov 2022 06:19:56 -0800 (PST)
X-Received: by 2002:a05:6214:1ccf:b0:4b3:6cde:3444 with SMTP id g15-20020a0562141ccf00b004b36cde3444mr12708647qvd.5.1668435595804;
        Mon, 14 Nov 2022 06:19:55 -0800 (PST)
Date: Mon, 14 Nov 2022 06:19:55 -0800 (PST)
From: Yelena Konyukh <ykonyukh@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <436612cf-fed1-4b6b-97a4-29683433c8e3n@googlegroups.com>
Subject: the use of 2nd stage MMU translation
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_4208_1406701257.1668435595098"
X-Original-Sender: ykonyukh@gmail.com
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

------=_Part_4208_1406701257.1668435595098
Content-Type: multipart/alternative; 
	boundary="----=_Part_4209_2012525797.1668435595098"

------=_Part_4209_2012525797.1668435595098
Content-Type: text/plain; charset="UTF-8"

Hi All,

I would be very grateful, if anyone could explain how Jailhouse on ARM64 
architectures uses the 2nd stage MMU translation.

It does look like Jailhouse uses the 2nd stage MMU translations  - for 
example, t is easy to find in the code where such registers as VTCR_EL2 and 
VTTBR_EL2 are set. I am guessing that Jailhouse, as one would expect from a 
hypervisor, uses 2nd stage translation to protect VMs (cells) from 
accessing each others memory (unless a memory region is explicitly shared 
with a root cell by specifying JAILHOUSE_MEM_ROOTSHARED). Is that so? Could 
anyone confirm? How is IPA<->PA mapping is done for VMs? Is it 1-to-1 
mapping (so that, in fact, PA equals IPA)?

Thank you very much in advance

Best Regards,

Yelena

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/436612cf-fed1-4b6b-97a4-29683433c8e3n%40googlegroups.com.

------=_Part_4209_2012525797.1668435595098
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi All,<br><br>I would be very grateful, if anyone could explain how Jailho=
use on ARM64 architectures uses the 2nd stage MMU translation.<br><br>It do=
es look like Jailhouse uses the 2nd stage MMU translations&nbsp; - for exam=
ple, t is easy to find in the code where such registers as <span><span>VTCR=
_EL2 and VTTBR_EL2 are set. I am guessing that Jailhouse, as one would expe=
ct from a hypervisor, uses 2nd stage translation to protect VMs (cells) fro=
m accessing each others memory (unless a memory region is explicitly shared=
 with a root cell by <span><span>specifying JAILHOUSE_MEM_ROOTSHARED). Is t=
hat so? Could anyone confirm? How is IPA&lt;-&gt;PA mapping is done for VMs=
? Is it 1-to-1 mapping (so that, in fact, PA equals IPA)?<br><br>Thank you =
very much in advance<br><br>Best Regards,<br><br>Yelena<br></span></span></=
span></span>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/436612cf-fed1-4b6b-97a4-29683433c8e3n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/436612cf-fed1-4b6b-97a4-29683433c8e3n%40googlegroups.co=
m</a>.<br />

------=_Part_4209_2012525797.1668435595098--

------=_Part_4208_1406701257.1668435595098--
