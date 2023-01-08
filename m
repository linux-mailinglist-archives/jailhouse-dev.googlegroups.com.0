Return-Path: <jailhouse-dev+bncBDF2DM773IIBBFNW5SOQMGQEQPYYGNI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-pg1-x537.google.com (mail-pg1-x537.google.com [IPv6:2607:f8b0:4864:20::537])
	by mail.lfdr.de (Postfix) with ESMTPS id 1878C66188E
	for <lists+jailhouse-dev@lfdr.de>; Sun,  8 Jan 2023 20:35:52 +0100 (CET)
Received: by mail-pg1-x537.google.com with SMTP id o6-20020a63f146000000b004b33f7f9a96sf412117pgk.5
        for <lists+jailhouse-dev@lfdr.de>; Sun, 08 Jan 2023 11:35:52 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1673206550; cv=pass;
        d=google.com; s=arc-20160816;
        b=ZstsP38gh04oTUos7oTxuv5KbSx+Ty9FkrJ6ewj9ZUP326+VhwiVHbVNp0FrleKkAr
         B6XdIUbRzxmORzC6T9/H09csJh9EpBC1ZA+c8vtdhrOa0m/P0wYkCmZl2tIE43S9Y7/S
         4jJotgdj9jZa6xNEhEnetIctQVCiU8WwR3bMBmH6bEyhWR1QSVT2NJZQpchAMbzpfMW6
         Fr5B2yOOYxLms7qAc9t4TDxHbDWfys0E8hZf4HxWdDBgYKUBgD7sqpQBEGcxr9mz5sTJ
         rmCJguy5T51U0h1BhwFE5rNXZbQa6cJzRp/4J5NpmAHSHIRLfvxuL66w5j05uhv8dOOu
         rLNg==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:to:subject:message-id:date:from
         :mime-version:sender:dkim-signature:dkim-signature;
        bh=ucPAiB8IS78ut7f3Xk0Bgc7NDX3T7CEvd7ubAFWb83o=;
        b=xpoI5XgKCGqE2jEtRZleX5C1HyaBMNQvCag0GN34TLXKT73W01+swm2vKF/65bdGl1
         QUTxuljer5rtepMeb0vfTPS98cqoY7lA2sOE0BvcQU8dTGziWaTagHb5SNO9HDvPNLKR
         LYzzqDC5deZx8K5++nvuPWC1MJ83kU3pshFBMW3uP408R5yY/IjD4OajTQw4sAG46BrW
         z3X+RIG8auAKfyi+XP+1er3Kd51Z1XZtK9UbYHQl0+rbrNR1YftUwkyVUdKhaxZ5Ttvs
         pMmstDZZ9csT/btPOp2mHOKEz/YidJWQbAbXQj7jf9AyrLCVEQo4VLQi9j8UGIadDUBl
         QLgA==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QaE5G+YZ;
       spf=pass (google.com: domain of tcharahien552@gmail.com designates 2607:f8b0:4864:20::12e as permitted sender) smtp.mailfrom=tcharahien552@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ucPAiB8IS78ut7f3Xk0Bgc7NDX3T7CEvd7ubAFWb83o=;
        b=Rk2KlrXofPD6mfyyJa/zQRJA04dx6jYw6azg/I8R+SWuIhU8AfJJq3XG3G/IQkiUg4
         j2TKTD/ddpG6Fo+Nucez4aD1yHW8TTkfdbVGU+bKmAhKQN5HICmRxhER0L3+ogQeQ0Xd
         j6MIlbeiLUQDtOsToHFyG9bs/Xqf9/FZ63X4nxBeM75ZOMDVva9MU99+huexpuRR8Gpf
         pas9aV8dlZlYRyMvDNK2yj4fF9qSPH/Rb0t2Z3Fmne4IJ7yifVikKET8T8SDkpJR/jAs
         pouQa+pW7/6Dwpz04yvomdQVWLO6wqNHIMsSpw2U09jjtf/rbLkMH4V5T3/LtDZZLWGX
         Jw+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-authentication-results
         :x-original-sender:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ucPAiB8IS78ut7f3Xk0Bgc7NDX3T7CEvd7ubAFWb83o=;
        b=diNOQBsc2Iva95uvPLEa3+oq0K/XpgmGER82n3Ek00PcAR+K2EmxTnfJo+/oxQyBDs
         9W3GKBFjI/CrDTRA4qV52DWE5HPFMcnXdBrfRP4JhL8a9sjcFOzxIcY5wryGz/bcikYs
         02dH7b3XYW5pXTwspihYQHkeukqERTYXADU8UccmvoCJCyHF8J9iH0RMfnkCS9CBwX0J
         e5QRj/ALzcMnYbXNiW3DwfFVVmT/VVubj+HeOvBJc8Lb3w86ehBtjbePLeQa8GM0Derk
         S/uLY0a0xU+7907hD0Nnb/bgoO4/0Ux5JvjZdhlt/HlX8tjld3bA9OH03LsTdFyhzKuO
         DGjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-authentication-results:x-original-sender:to:subject
         :message-id:date:from:mime-version:x-gm-message-state:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ucPAiB8IS78ut7f3Xk0Bgc7NDX3T7CEvd7ubAFWb83o=;
        b=17eIQJOvAs7blyaID73x09sQZPJPREHmA8Kw85O7a+U52OmErqjkKj0H46bzlvRt4B
         fzCs/7ty9bJbfETvzdYqgLbX08YndmFU2pWJJjpqPC/EUTGWOa01bEa65F4HfF2ybFeC
         IJxjm37mkTzYhQJKMOS+EDGOE4wShz848MYhqrFHsf2nutqdELPFbTdcmtNnkjqrwdKx
         JWx82CbnNBp7k+jWRoPmTgSUn1cb1VBYr45ufYWu3AIWgE0rOG/be+HNlDmh3mZC683L
         0psL5lP5NA00OFKD6YDsHdHhbXbwDQH0uD/0MgHzIcj1fI5NBuFuGYR1dfqo5cBqCftR
         zhTQ==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AFqh2koxkAayRkdjFkfiYQrNpgWtP71NwJD9qgH3ettl+xz6UoWF9cXF
	TPeb0JtMzrkisDKFYo3BZbo=
X-Google-Smtp-Source: AMrXdXtO41roVq/vaktwtBCC0yhiRW1oke7XSMP9mWE0o6C2yC9TV4Rzb7yFzxt+12FNdeI3caxasg==
X-Received: by 2002:a63:5351:0:b0:4ad:2cc5:f863 with SMTP id t17-20020a635351000000b004ad2cc5f863mr583656pgl.395.1673206550404;
        Sun, 08 Jan 2023 11:35:50 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a17:90a:178e:b0:227:1b53:908c with SMTP id
 q14-20020a17090a178e00b002271b53908cls148314pja.1.-pod-canary-gmail; Sun, 08
 Jan 2023 11:35:49 -0800 (PST)
X-Received: by 2002:a05:6a20:1017:b0:b3:ed81:9f58 with SMTP id a23-20020a056a20101700b000b3ed819f58mr56788137pzd.52.1673206549027;
        Sun, 08 Jan 2023 11:35:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673206549; cv=none;
        d=google.com; s=arc-20160816;
        b=G3XBf3K8PtJNj1NHxKmfhsWVKJEX3Bytrvmgwqp2ra+Od6lsTeJ9STqxVNi3UAxE89
         hrz9ZHRNLTU7tN0Q64drj99+BnZI4zMeWir9fGUgSBrc0sOKmijhiJZUSOy+2yyBW9pY
         yUDjHOPcN3PZVpOoa9KP63+kFOPXvR2MFuYuIo+uHRMaiZcpoHr7ePlxMLkfX+QGIUS8
         XGtxezBf3JXXswGBMbROTKrNzToL9wmNGVs+1D8C8LYkuqjH5IrjtvZSFYXFsbQeeGUp
         EiZ6BSx82kZCnJFh+ka8Mksai4SCZsdeoA58er99TZIhQE7jxyRc5vcx3IgO2CGIOvMQ
         02EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=Nf0WUd3M+5pU6aEoNHt2d/gzIwZGBTWQmsZfY5GroBE=;
        b=CDdlX15pOn0bBV3bwextG25RHJ5qH+XLzYxTUtkuHMkr6IpAZytc7irphVdqLgwc3C
         Rt1crkN8SVjNt4A1pcd88NDWtvF6BXwSF89fffSdAzMg62TANA0N3wrKTaYR13Zy0aIT
         blZuAYOmaU+8Fgqr+Tgg3HQy/Kw4HSzMn+A814ZyiVknjSDSOi3budrxf1GHNi+Fw6vo
         WeVbk5PSl1+RhAFzP9mpDtQq7etKPYjnFhEMaGTmqOQg6u2DI8ZwO4QKAwBVq9+37NqN
         ju7ahIyuMG1T0e6wUcrVIB0bVhFUvB3r6JbRNvCoShI+/3670PL9k+i6rpTh85bR5ptb
         S6HA==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=QaE5G+YZ;
       spf=pass (google.com: domain of tcharahien552@gmail.com designates 2607:f8b0:4864:20::12e as permitted sender) smtp.mailfrom=tcharahien552@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com. [2607:f8b0:4864:20::12e])
        by gmr-mx.google.com with ESMTPS id q4-20020aa79824000000b00575c981b799si444882pfl.3.2023.01.08.11.35.49
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Jan 2023 11:35:49 -0800 (PST)
Received-SPF: pass (google.com: domain of tcharahien552@gmail.com designates 2607:f8b0:4864:20::12e as permitted sender) client-ip=2607:f8b0:4864:20::12e;
Received: by mail-il1-x12e.google.com with SMTP id u8so3935362ilg.0
        for <jailhouse-dev@googlegroups.com>; Sun, 08 Jan 2023 11:35:48 -0800 (PST)
X-Received: by 2002:a92:a309:0:b0:30b:f177:daa5 with SMTP id
 a9-20020a92a309000000b0030bf177daa5mr3811757ili.265.1673206548439; Sun, 08
 Jan 2023 11:35:48 -0800 (PST)
MIME-Version: 1.0
From: AGENCE IMMO <immobilierintern@gmail.com>
Date: Sun, 8 Jan 2023 19:35:37 +0000
Message-ID: <CAPrpWc4GMSRb3O2oSUHBz9Q1wmz=Y-+eaXuG0Fb2MshT_X2OnA@mail.gmail.com>
Subject: =?UTF-8?Q?R=C3=A8glement=2DLoyer?=
To: undisclosed-recipients:;
Content-Type: multipart/alternative; boundary="000000000000f4a9c305f1c5c154"
X-Original-Sender: immobilierintern@gmail.com
X-Original-Authentication-Results: gmr-mx.google.com;       dkim=pass
 header.i=@gmail.com header.s=20210112 header.b=QaE5G+YZ;       spf=pass
 (google.com: domain of tcharahien552@gmail.com designates 2607:f8b0:4864:20::12e
 as permitted sender) smtp.mailfrom=tcharahien552@gmail.com;       dmarc=pass
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

--000000000000f4a9c305f1c5c154
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A votre aimable attention,



Nous vous informons qu'une mise =C3=A0 jour a =C3=A9t=C3=A9 effectu=C3=A9e =
au sein de notre
=C3=A9tablissement. De ce fait, nous avons apport=C3=A9 quelques changement=
s au
niveau compta,




Veuillez confirmer la r=C3=A9ception de notre diffusion, afin de vous envoy=
er
les nouvelles coordonn=C3=A9es bancaires pour le versement mensuel.



Vous souhaitant une tr=C3=A8s bonne et heureuse ann=C3=A9e 2023, ainsi qu'u=
ne bonne
r=C3=A9ception de la pr=C3=A9sente.



Bien cordialement,



*Le S.ervice G.estion L.ocative.*

--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/CAPrpWc4GMSRb3O2oSUHBz9Q1wmz%3DY-%2BeaXuG0Fb2MshT_X2OnA%40mai=
l.gmail.com.

--000000000000f4a9c305f1c5c154
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div id=3D"gmail-:33c" class=3D"gmail-Ar gmail-Au gmail-Ao=
" style=3D"display:block"><div id=3D"gmail-:338" class=3D"gmail-Am gmail-Al=
 editable gmail-LW-avf gmail-tS-tW gmail-tS-tY" aria-label=3D"Corps du mess=
age" role=3D"textbox" aria-multiline=3D"true" style=3D"direction:ltr;min-he=
ight:331px" tabindex=3D"1" aria-controls=3D":364"><div id=3D"gmail-:1u2" cl=
ass=3D"gmail-Ar gmail-Au" style=3D"display:block"><div id=3D"gmail-:1ty" cl=
ass=3D"gmail-Am gmail-Al editable gmail-LW-avf gmail-tS-tW gmail-tS-tY" ari=
a-label=3D"Corps du message" role=3D"textbox" aria-multiline=3D"true" style=
=3D"direction:ltr;min-height:331px" tabindex=3D"1" aria-controls=3D":1wu"><=
div id=3D"gmail-:ad" class=3D"gmail-Ar gmail-Au gmail-Ao" style=3D"display:=
block"><div id=3D"gmail-:f1" class=3D"gmail-Am gmail-Al editable gmail-LW-a=
vf gmail-tS-tW gmail-tS-tY" aria-label=3D"Corps du message" role=3D"textbox=
" aria-multiline=3D"true" style=3D"direction:ltr;min-height:331px" tabindex=
=3D"1" aria-controls=3D":12l"><div id=3D"gmail-:p0" class=3D"gmail-Ar gmail=
-Au" style=3D"display:block"><div id=3D"gmail-:ow" class=3D"gmail-Am gmail-=
Al editable gmail-LW-avf gmail-tS-tW gmail-tS-tY" aria-label=3D"Corps du me=
ssage" role=3D"textbox" aria-multiline=3D"true" style=3D"direction:ltr;min-=
height:331px" tabindex=3D"1" aria-controls=3D":rs"><div id=3D"gmail-:et" cl=
ass=3D"gmail-Ar gmail-Au gmail-Ao" style=3D"display:block"><div id=3D"gmail=
-:ep" class=3D"gmail-Am gmail-Al editable gmail-LW-avf gmail-tS-tW gmail-tS=
-tY" aria-label=3D"Corps du message" role=3D"textbox" aria-multiline=3D"tru=
e" style=3D"direction:ltr;min-height:331px" tabindex=3D"1" aria-controls=3D=
":hl"><p style=3D"font-style:normal;font-variant-caps:normal;font-weight:40=
0;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:non=
e;white-space:normal;word-spacing:0px;text-decoration:none;box-sizing:conte=
nt-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-s=
erif;color:rgb(68,68,68);font-size:11pt"><span style=3D"box-sizing:content-=
box;line-height:1.4em;font-size:13.5pt;font-family:&quot;Times New Roman&qu=
ot;,serif;color:rgb(20,20,20)">A votre aimable attention,</span></p><p styl=
e=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;margin=
:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rg=
b(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-style:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-=
decoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:=
1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><s=
pan style=3D"box-sizing:content-box;line-height:1.4em;font-size:13.5pt;font=
-family:&quot;Times New Roman&quot;,serif;color:rgb(20,20,20)">Nous vous in=
formons qu&#39;une mise =C3=A0 jour a =C3=A9t=C3=A9 effectu=C3=A9e au sein =
de notre =C3=A9tablissement. De ce fait, nous avons apport=C3=A9 quelques c=
hangements au niveau compta,<span class=3D"gmail-Apple-converted-space">=C2=
=A0</span><br></span></p><p style=3D"font-style:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;text-decoration:no=
ne;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-fa=
mily:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><span style=3D"=
box-sizing:content-box;line-height:1.4em;font-size:13.5pt;font-family:&quot=
;Times New Roman&quot;,serif;color:rgb(20,20,20)"><br></span></p><p style=
=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-spaci=
ng:normal;text-align:start;text-indent:0px;text-transform:none;white-space:=
normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;margin:=
0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rgb=
(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-style:normal;font-var=
iant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;tex=
t-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-d=
ecoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1=
.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><sp=
an style=3D"box-sizing:content-box;line-height:1.4em;font-size:13.5pt;font-=
family:&quot;Times New Roman&quot;,serif;color:rgb(20,20,20)">Veuillez conf=
irmer la r=C3=A9ception de notre diffusion, afin de vous envoyer les nouvel=
les coordonn=C3=A9es bancaires pour le versement mensuel.</span></p><p styl=
e=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-align:start;text-indent:0px;text-transform:none;white-space=
:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;margin=
:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:rg=
b(68,68,68);font-size:11pt">=C2=A0</p><p style=3D"font-style:normal;font-va=
riant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;te=
xt-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;text-=
decoration:none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:=
1.4em;font-family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt"><s=
pan style=3D"box-sizing:content-box;line-height:1.4em;font-size:13.5pt;font=
-family:Times,serif;color:rgb(12,12,12)">Vous souhaitant une tr=C3=A8s bonn=
e et heureuse ann=C3=A9e 2023, ainsi qu&#39;une bonne r=C3=A9ception de la =
pr=C3=A9sente.</span></p><p style=3D"font-style:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px=
;text-transform:none;white-space:normal;word-spacing:0px;text-decoration:no=
ne;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-fa=
mily:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><p st=
yle=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-sp=
acing:normal;text-align:start;text-indent:0px;text-transform:none;white-spa=
ce:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;marg=
in:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;color:=
rgb(68,68,68);font-size:11pt"><span style=3D"box-sizing:content-box;line-he=
ight:1.4em;font-size:13.5pt;font-family:Times,serif;color:rgb(14,14,14)">Bi=
en cordialement,</span></p><p style=3D"font-style:normal;font-variant-caps:=
normal;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0=
px;text-transform:none;white-space:normal;word-spacing:0px;text-decoration:=
none;box-sizing:content-box;margin:0cm 0cm 0.0001pt;line-height:1.4em;font-=
family:Calibri,sans-serif;color:rgb(68,68,68);font-size:11pt">=C2=A0</p><p =
style=3D"font-style:normal;font-variant-caps:normal;font-weight:400;letter-=
spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-s=
pace:normal;word-spacing:0px;text-decoration:none;box-sizing:content-box;ma=
rgin:0cm 0cm 0.0001pt;line-height:1.4em;font-family:Calibri,sans-serif;colo=
r:rgb(68,68,68);font-size:11pt"><i style=3D"box-sizing:content-box;line-hei=
ght:1.4em"><span style=3D"box-sizing:content-box;line-height:1.4em;font-siz=
e:13.5pt;font-family:Times,serif;color:rgb(60,115,191)">Le S.ervice G.estio=
n L.ocative.</span></i></p></div></div></div></div></div></div></div></div>=
</div></div></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/CAPrpWc4GMSRb3O2oSUHBz9Q1wmz%3DY-%2BeaXuG0Fb2MshT_=
X2OnA%40mail.gmail.com?utm_medium=3Demail&utm_source=3Dfooter">https://grou=
ps.google.com/d/msgid/jailhouse-dev/CAPrpWc4GMSRb3O2oSUHBz9Q1wmz%3DY-%2BeaX=
uG0Fb2MshT_X2OnA%40mail.gmail.com</a>.<br />

--000000000000f4a9c305f1c5c154--
