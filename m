Return-Path: <jailhouse-dev+bncBC66VFVAYQKBBVFCTOQQMGQEO446NWI@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-yb1-xb3c.google.com (mail-yb1-xb3c.google.com [IPv6:2607:f8b0:4864:20::b3c])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2866D2030
	for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Mar 2023 14:25:58 +0200 (CEST)
Received: by mail-yb1-xb3c.google.com with SMTP id k199-20020a2524d0000000b00b7f3a027e50sf6879485ybk.4
        for <lists+jailhouse-dev@lfdr.de>; Fri, 31 Mar 2023 05:25:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112; t=1680265557;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZOzc3bOTtHLCniBft+1cxH0HNWIkmt417qoxPyv9eYw=;
        b=P23ikXLWQhoNQvQVAKQci/GZHSeG9SsJWMy94mhJltXCRzjBSM7Jg7FiPBbgon9EjJ
         fGHhABxY+GvznFMrQ9sAIlVudlU268ApWwKhbq0BhBJ23bElQIUbDa5yq993tW4MZHcl
         5t2ZD0a7GqE7m6/vNi7H45Pr8xR8UsU5Z8djSQmNNStlnLuUzrzsGGii3oQKzsEY7CG2
         D8jZy6Jo2Ip5MRmaAj5MUfbviWddw3xkT0/VLAr2sUXk36hgAgY4R94/XxBgxGEWqiXI
         xMRoSXC0lmT93+o3lcC22SLEDJidGp9ms6nKR8ELyqUYU+BPUknYC4pf5Cut6vNwVB6o
         yGhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680265557;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:x-original-sender:mime-version
         :subject:message-id:to:from:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOzc3bOTtHLCniBft+1cxH0HNWIkmt417qoxPyv9eYw=;
        b=IOVBD4mvPGQRdPlujz74xOSm56CGRPato9Ct8wPEJtrGqNvy1/CjirEaZZeaOZZgou
         +7FawwikU891C1KoSsnh6Y74qCP2dm1SalGKVUmsiWu66WCU4M+J5jsoFZfdov0SIHEU
         Mj9QWiEZTIt4ij72PmJoru+KDvPvMmW5gbV7kUIBMl1NxVh7WsjMYQRsGUb8Uy5EISwp
         FMELBYQKzUKHDMgBAbp2DKvGWyShI8R8ainD3APUaicwFTcymINOQz23bGI/ld+wgRJF
         DQcanEhv61iJvengaAhBJvFFwCggq16oyo2Aq9AG33hducYUb0/3nMPSLimSPC+5HGh6
         4ClA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265557;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :x-spam-checked-in-group:list-id:mailing-list:precedence
         :x-original-sender:mime-version:subject:message-id:to:from:date
         :x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZOzc3bOTtHLCniBft+1cxH0HNWIkmt417qoxPyv9eYw=;
        b=qh1bVEn0jxTCttsFLY2srVi+oqjK0bLFRDSX7sMu/SNXOWGE6yE5NAsbmSwQwfYMFE
         ua6IhlINSVy4fYZajl7Hf7BSyyqZemlXNaXX5legW/OdQKc0+Du1mc1xzuRomXE6XFWA
         T5YhO+KSBWygPqgKtEIeP3Sm6lg4QSfxXm5CSFJWv7iTROOmvJ43+irGO3yvlrPwjX9l
         67sWuTGFt/ShHk453bxIN8pm914aw5Qa+O8bB1kfEWtq6DZdR7lm2LtksNJaJhyiP8C/
         GHHeTlrY8X3PbgfG6Q4Zh+v3NafP8sizJNZygbSU9iLTxs4Vg4Ho+vywTfZ2O7ORibnH
         FsUw==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AAQBX9cl71dtSFZ+BNglNlaIDcQ+bi469VJ1cNHnHMp84DJayaqp04Ek
	DHQKWNAG/+TnVbfOYGmveK0=
X-Google-Smtp-Source: AKy350ZeUqyVuGZ9SlFb236Aq0ANrozELTjFIu5OB0zxzIgJv/AUqbwPoX7LpIBLRkTx3myb1Xcw+Q==
X-Received: by 2002:a25:542:0:b0:a6b:bc64:a0af with SMTP id 63-20020a250542000000b00a6bbc64a0afmr17299119ybf.4.1680265557605;
        Fri, 31 Mar 2023 05:25:57 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a25:3701:0:b0:b2f:abaa:a54a with SMTP id e1-20020a253701000000b00b2fabaaa54als2850855yba.6.-pod-prod-gmail;
 Fri, 31 Mar 2023 05:25:56 -0700 (PDT)
X-Received: by 2002:a25:cf81:0:b0:b76:ceb2:661d with SMTP id f123-20020a25cf81000000b00b76ceb2661dmr13977826ybg.7.1680265556210;
        Fri, 31 Mar 2023 05:25:56 -0700 (PDT)
Date: Fri, 31 Mar 2023 05:25:55 -0700 (PDT)
From: Johan Carlsson <johan.carlsson89@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <596f9ab5-8817-4ddb-8c0b-8d1dfbfd8007n@googlegroups.com>
Subject: gic-v3 inject pending interrupt.
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_3476_1486764478.1680265555550"
X-Original-Sender: johan.carlsson89@gmail.com
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

------=_Part_3476_1486764478.1680265555550
Content-Type: multipart/alternative; 
	boundary="----=_Part_3477_394866074.1680265555550"

------=_Part_3477_394866074.1680265555550
Content-Type: text/plain; charset="UTF-8"

Hi, I'm sending SGI interrupts between cores with a gic-v3 and noticed that 
it sometimes the interrupts were lost. After some tinkering I realised that 
gicv3_inject_irq skips the interrupt if it is already in a the list. I'm 
not sure this is correct but I expect that the if it is already in the list 
but marked as active the pending bit should be set and return.

With the following change no SGI interrupt where dropped.

--- a/hypervisor/arch/arm-common/gic-v3.c
+++ b/hypervisor/arch/arm-common/gic-v3.c
@@ -566,8 +566,16 @@ static int gicv3_inject_irq(u16 irq_id, u16 sender)
                 * A strict phys->virt id mapping is used for SPIs, so this 
test
                 * should be sufficient.
                 */
-               if ((u32)lr == irq_id)
+               if ((u32)lr == irq_id) {
+                       /* if interrupt is active set pending bit. */
+                       if ((lr & ICH_LR_PENDACTIVE) == ICH_LR_ACTIVE) {
+                               lr |= ICH_LR_GROUP_BIT;
+                               lr |= ICH_LR_PENDING;
+                               gicv3_write_lr(n, lr);
+                               return 0;
+                       }
                        return -EEXIST;
+               }
        }

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/596f9ab5-8817-4ddb-8c0b-8d1dfbfd8007n%40googlegroups.com.

------=_Part_3477_394866074.1680265555550
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, I'm sending SGI interrupts between cores with a gic-v3 and noticed that=
 it sometimes the interrupts were lost. After some tinkering I realised tha=
t gicv3_inject_irq skips the interrupt if it is already in a the list. I'm =
not sure this is correct but I expect that the if it is already in the list=
 but marked as active the pending bit should be set and return.<div><br /><=
/div><div>With the following change no SGI interrupt where dropped.</div><d=
iv><br /></div><div>--- a/hypervisor/arch/arm-common/gic-v3.c<br /></div><d=
iv>+++ b/hypervisor/arch/arm-common/gic-v3.c<br />@@ -566,8 +566,16 @@ stat=
ic int gicv3_inject_irq(u16 irq_id, u16 sender)<br />=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* A strict phys-&gt;virt id mappin=
g is used for SPIs, so this test<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0* should be sufficient.<br />=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br />- =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((u32)lr =3D=3D irq_id)<br />+ =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((u32)lr =3D=3D irq_id) {<br />+ =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 /* if interrupt is active set pending bit. */<br />+ =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if ((lr &amp; I=
CH_LR_PENDACTIVE) =3D=3D ICH_LR_ACTIVE) {<br />+ =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 lr |=3D ICH_LR_GROUP_BIT;<br />+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 lr |=
=3D ICH_LR_PENDING;<br />+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gicv3_write_lr(n, =
lr);<br />+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br />+ =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br />=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return -EEXIST;<br />+ =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 }<br />=C2=A0 =C2=A0 =C2=A0 =C2=A0 }</div><div><br /></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/596f9ab5-8817-4ddb-8c0b-8d1dfbfd8007n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/596f9ab5-8817-4ddb-8c0b-8d1dfbfd8007n%40googlegroups.co=
m</a>.<br />

------=_Part_3477_394866074.1680265555550--

------=_Part_3476_1486764478.1680265555550--
