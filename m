Return-Path: <jailhouse-dev+bncBCQK3U555QDBBBNAU6JAMGQEPGO4IMI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yw1-x113d.google.com (mail-yw1-x113d.google.com [IPv6:2607:f8b0:4864:20::113d])
	by mail.lfdr.de (Postfix) with ESMTPS id ADC5A4F0B55
	for <lists+jailhouse-dev@lfdr.de>; Sun,  3 Apr 2022 18:49:10 +0200 (CEST)
Received: by mail-yw1-x113d.google.com with SMTP id 00721157ae682-2dc7bdd666fsf64748407b3.7
        for <lists+jailhouse-dev@lfdr.de>; Sun, 03 Apr 2022 09:49:10 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1649004549; cv=pass;
        d=google.com; s=arc-20160816;
        b=tItjaZqafzjybELMCJqSZ4u2bZscMtp/yVdv1aFBacya+k/Y9kjbotMTSwn6woKy/9
         C96QQ346DvnhN1eu/DjQwvTsC72ClELh4IgMJw9O27cfhzzE+sLob1ZuSyIvIpjBGaMl
         aVlhD2A4DIyQwkvvhMEJL1/THRLRALhlhMzA+84XqK3/qQETBAsAMB3wLn1fBg+yQpBm
         Sa2vgf9m3KIEUnnmmysDt4q4D9iQWaByPKIIt+RjjIktd04Is17evIN8VIjtRKMX1BFO
         zjkvbwnc+kj0VTb4OLHH2wFFGcEb2yXpPYX6mjdey5GiIOMozAANpD/+TnN0/4id298R
         CJcQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=GJokZ9PuGYzTAfBWf9AjBnunr3N+3fPbElJGieuNlAE=;
        b=sd+vXBCsZfmjJhY6BgfA0YBmOLQX8CScX1aRgL0oi2PmrPU11Zf+g+coRbY37yeGpn
         xxtZB10o0XMu9NjQVbc0qNUxZV+wVwshC1xLxb0SAKGMVRTnxy5DdU2h5WQWUW/ZHhQt
         v3b+vXs1nA8WSFq/WcagLFiMZoY5OYpdVOghhv3ptCNZxJ8DHDcxu/eiy16vpfEovAdF
         kbcuotvzxGaY3ChGVUtwMHMvF8I2ilN6jSz43W0bpN9dzCWozv2cvyuaz6XXF53ZwznM
         vto15KVFI78GM3BZgSu0JPWCq6MrsPq52tESYY/voNHH37SpJBBnlmxX7+Z9ts6ljovm
         xLgQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mejq+0ju;
       spf=pass (google.com: domain of gozieerchi@gmail.com designates 2607:f8b0:4864:20::b43 as permitted sender) smtp.mailfrom=gozieerchi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:mime-version:from:date:message-id:subject:to
         :x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=GJokZ9PuGYzTAfBWf9AjBnunr3N+3fPbElJGieuNlAE=;
        b=AkP+4UVBGDY99Y1fG6YUGwM6dCTonZdZQ+Cg85Yv/M2s5Qvm1imCJcUyUUX0MQoKH5
         AC3iEpUOBl+85BZZSc7NJJ2w+swaM+RM/hosYWvRTLDx7OyOAqoUS2Id8CvUT/wuTFvk
         5edgWYA6mvHmalbr/Gl1X/tXwKeKdFAe+lgLF1CITiOIi6/Ikm06J/Xz599+CydGNj4Z
         ZhWoC7LCT+9ZpHPngPJgRbRKZyYcPYkRvQZtKQtnaHBGBNhi5llvuy85o0M5EkyJoXsv
         TLE3m4BAPMSophKz5mL2zJ+cD9DG71iySGcsMogMHGAenRdC39h+Zu/4yql+rKp1qzi8
         IYvQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :list-post:list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=GJokZ9PuGYzTAfBWf9AjBnunr3N+3fPbElJGieuNlAE=;
        b=FoDqhl4Qi5u5www3XtsS7G6bv3nw1Z574VxOo5ZSobvN+hFhf14gqVU3H44uhkpZOU
         hsacYUpvjLmRbMnLVs0zZXXrMhlc71ANv5uSESGMLtyd/nSXRoG+woB1HT/H7Hnhsn6g
         3pHKO+5gbag3ZuiX5jiZLY8QIGDB4XhUpPYFCCyGdZXOE9gnlBdd4r8VxLdH+5yrlwhO
         Qf0MSiZV06s9wGYPf5/BS6Pd6R06cdT1ESWwF0votIyiNH8wAsKto97zGV0uLpqLqBDD
         dryupsQi/VYhEs3uo1TD/D176V/CiiTQooobyy0dOJkVgy3k0KXcZm2kJtd/mNOCTnoI
         1xcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:mime-version:from:date:message-id:subject
         :to:x-original-sender:x-original-authentication-results:precedence
         :mailing-list:list-id:x-spam-checked-in-group:list-post:list-help
         :list-archive:list-subscribe:list-unsubscribe;
        bh=GJokZ9PuGYzTAfBWf9AjBnunr3N+3fPbElJGieuNlAE=;
        b=UwjO7jz96kW9b9/Z52PMT2HEGgsa+8SOXVgk3WgONIG3n3xnDOxbKpvu1uHQtdD5Qw
         WFm2paQs8ETjNvBiGgmX94A49dtNJAn+EpeMB/FXeS23cjPLO1ChKlZMygMJddHqFeAw
         IR53VIIbdtjG/icC9VeMOt8761bWbwl3zLTfqNHz7FHv3K7Dh6TAvrtAhknO0AhQXSgT
         Qi0EXAHwFDjbmVbuW1HnE1zdSk3dLxha/NsF0Tu+NnmWswxbj7SNYlQ3UByoOVdlEofx
         RuKGFK7Gp2VYXkOc6E3H1lCYpeq+kzFgjtMZGPbd3ccCnVOL377vzyCgeU+5N1j54VJn
         tqbg==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/7UCM1IAJ/Ue8INFs5RFDgrMxytRVkqVLq6Zgoj+8nEzuvcCY
	/GOkm3vW+BPhrnyUXc6aub4=
X-Google-Smtp-Source: ABdhPJz4DbuADrMjMw5p3uJt4cxFbhz/L0prdy1M3L5hFrRWfvmvUp9QgzzOg5ai2DY6C4Dm3N5gxw==
X-Received: by 2002:a81:ad44:0:b0:2eb:1afe:c724 with SMTP id l4-20020a81ad44000000b002eb1afec724mr13122061ywk.9.1649004549604;
        Sun, 03 Apr 2022 09:49:09 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:2c02:0:b0:638:425:2eec with SMTP id s2-20020a252c02000000b0063804252eecls5112922ybs.2.gmail;
 Sun, 03 Apr 2022 09:49:08 -0700 (PDT)
X-Received: by 2002:a05:6902:1103:b0:63d:dd16:87a3 with SMTP id o3-20020a056902110300b0063ddd1687a3mr148898ybu.492.1649004548921;
        Sun, 03 Apr 2022 09:49:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1649004548; cv=none;
        d=google.com; s=arc-20160816;
        b=laOaqzLkANNN33RtB/fvg1udYz3o3pTgJqIbQ6+2AFm7c8KFEVn2w8yxS5uZrk9Ug1
         IwlBRBmEDQJ54Nz7EKFkO/CKYwi/d8GnUnDB5wJFkxQMvDArj2WcYITGSlrfJ49Ivnud
         C8k5alujPmDdctQBIknzXZCYkuvbavnxvXoZj73Dzz8h5E7Lr6h1fEOWGgny9OAhznJY
         E98nc1klTny23gnkI0LWrk9ocZft0aSBipc7pMNW2PfYto2s4serjQ58pBgUQuwWbC1t
         /tmMrSyD9FWnk98OyVDI8Td65ETHH/VKO1WfrVCgN4gNwsxsCMUGYfvS3xdTxNjEjCSh
         R3Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ChI0s4x412IRPUxsJSYewlnyQXdo9sWGe0OwBo5Colc=;
        b=VdVahkI2B0ktZUk2+GnctxhuRhZUPXyp901EPwqkaisxmz39/gGJ4ypx0wk2bew492
         exGcQAgVhgqic5kfHSgg2qw1OtoubB6X5f661tRbNKSPZ4kdOg8FaktBAniEZ6t9I3Am
         djO1t2hp3GoLTapeVQoL2gDs1JepS5LPMS6C7tOgOTRO+uB+ZWOFm24g0Y07ke/nriYi
         gUpj80x3DZUaALtemD/FQKwApEIUYmdcqsUShxn+THesZ6QyPZGRlcOboEVTY/pFGWOw
         yOl9scB10Mzh4PLbug7rpasxGgD7d4zxOr83d7uQs21OdfEE1zQv/cOrjrQYNZh5U0st
         LgXA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=Mejq+0ju;
       spf=pass (google.com: domain of gozieerchi@gmail.com designates 2607:f8b0:4864:20::b43 as permitted sender) smtp.mailfrom=gozieerchi@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-yb1-xb43.google.com (mail-yb1-xb43.google.com. [2607:f8b0:4864:20::b43])
        by gmr-mx.google.com with ESMTPS id k203-20020a8156d4000000b002d1484ca9bcsi404946ywb.0.2022.04.03.09.49.08
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Apr 2022 09:49:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of gozieerchi@gmail.com designates 2607:f8b0:4864:20::b43 as permitted sender) client-ip=2607:f8b0:4864:20::b43;
Received: by mail-yb1-xb43.google.com with SMTP id g9so13689848ybf.1
        for <jailhouse-dev@googlegroups.com>; Sun, 03 Apr 2022 09:49:08 -0700 (PDT)
X-Received: by 2002:a25:1443:0:b0:63d:6c01:d26f with SMTP id
 64-20020a251443000000b0063d6c01d26fmr11198756ybu.296.1649004548463; Sun, 03
 Apr 2022 09:49:08 -0700 (PDT)
MIME-Version: 1.0
From: Mrs Aisha Al-Qaddafi <mrsaishaalqaddfimrsaishaalqadd@gmail.com>
Date: Sun, 3 Apr 2022 09:48:42 -0700
Message-ID: <CAA25HkME3Cgz0RQUSPbMj3Xa+D=5UDX92qctxyZwsT8StCtKqg@mail.gmail.com>
Subject: please Dear i need your urgent reply
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="00000000000058204805dbc2cac6"
X-Original-Sender: mrsaishaalqaddfimrsaishaalqadd@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=Mejq+0ju;       spf=pass
 (google.com: domain of gozieerchi@gmail.com designates 2607:f8b0:4864:20::b43
 as permitted sender) smtp.mailfrom=gozieerchi@gmail.com;       dmarc=pass
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

--00000000000058204805dbc2cac6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

please Dear i need your urgent reply

Please bear with me. I am writing this letter to you with tears and sorrow
from my heart.

I am Aisha Muammar Gaddafi, the only daughter of the embattled president of
Libya, Hon. Muammar Gaddafi. I know my mail might come

to you as a surprise because you don=E2=80=99t know me, but due to the unso=
licited
nature of my situation here in Refugee camp Ouagadougou

Burkina Faso i decided to contact you for help. I have passed through pains
and sorrowful moments since the death of my father. At the

same time, my family is the target of Western nations led by Nato who want
to destroy my father at all costs. Our investments and bank

accounts in several countries are their targets to freeze.

My Father of blessed memory deposited the sum of $27.5M (Twenty Seven
Million Five Hundred Thousand Dollars) in a Bank at Burkina

Faso which he used my name as the next of kin. I have been commissioned by
the (BOA) bank to present an interested foreign

investor/partner who can stand as my trustee and receive the fund in his
account for a possible investment in his country due to my

refugee status here in Burkina Faso.

I am in search of an honest and reliable person who will help me and stand
as my trustee so that I will present him to the Bank for the

transfer of the fund to his bank account overseas. I have chosen to contact
you after my prayers and I believe that you will not betray my

trust but rather take me as your own sister or daughter. If this
transaction interests you, you don't have to disclose it to anybody because

of what is going on with my entire family, if the United nation happens to
know this account, they will freeze it as they freeze others, so

please keep this transaction only to yourself until we finalize it.

Sorry for my pictures. I will enclose it in my next mail and more about me
when I hear from you okay.

Yours Sincerely
Best Regard,
Aisha Gaddafi

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAA25HkME3Cgz0RQUSPbMj3Xa%2BD%3D5UDX92qctxyZwsT8StCtKqg%40mai=
l.gmail.com.

--00000000000058204805dbc2cac6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">please Dear i need your urgent reply<br><br>Please bear wi=
th me. I am writing this letter to you with tears and sorrow from my heart.=
<br><br>I am Aisha Muammar Gaddafi, the only daughter of the embattled pres=
ident of Libya, Hon. Muammar Gaddafi. I know my mail might come <br><br>to =
you as a surprise because you don=E2=80=99t know me, but due to the unsolic=
ited nature of my situation here in Refugee camp Ouagadougou <br><br>Burkin=
a Faso i decided to contact you for help. I have passed through pains and s=
orrowful moments since the death of my father. At the <br><br>same time, my=
 family is the target of Western nations led by Nato who want to destroy my=
 father at all costs. Our investments and bank <br><br>accounts in several =
countries are their targets to freeze.<br><br>My Father of blessed memory d=
eposited the sum of $27.5M (Twenty Seven Million Five Hundred Thousand Doll=
ars) in a Bank at Burkina <br><br>Faso which he used my name as the next of=
 kin. I have been commissioned by the (BOA) bank to present an interested f=
oreign <br><br>investor/partner who can stand as my trustee and receive the=
 fund in his account for a possible investment in his country due to my <br=
><br>refugee status here in Burkina Faso.<br><br>I am in search of an hones=
t and reliable person who will help me and stand as my trustee so that I wi=
ll present him to the Bank for the <br><br>transfer of the fund to his bank=
 account overseas. I have chosen to contact you after my prayers and I beli=
eve that you will not betray my <br><br>trust but rather take me as your ow=
n sister or daughter. If this transaction interests you, you don&#39;t have=
 to disclose it to anybody because <br><br>of what is going on with my enti=
re family, if the United nation happens to know this account, they will fre=
eze it as they freeze others, so <br><br>please keep this transaction only =
to yourself until we finalize it.<br><br>Sorry for my pictures. I will encl=
ose it in my next mail and more about me when I hear from you okay.<br><br>=
Yours Sincerely<br>Best Regard,<br>Aisha Gaddafi</div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAA25HkME3Cgz0RQUSPbMj3Xa%2BD%3D5UDX92qctxyZwsT8St=
CtKqg%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAA25HkME3Cgz0RQUSPbMj3Xa%2BD%3D5UDX92q=
ctxyZwsT8StCtKqg%40mail.gmail.com</a>.<br />

--00000000000058204805dbc2cac6--
