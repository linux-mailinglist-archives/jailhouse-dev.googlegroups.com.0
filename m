Return-Path: <jailhouse-dev+bncBC7PTOEB2ALRB3EK2KBAMGQEA6PJZCA@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x83a.google.com (mail-qt1-x83a.google.com [IPv6:2607:f8b0:4864:20::83a])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C2E3341B06
	for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 12:05:19 +0100 (CET)
Received: by mail-qt1-x83a.google.com with SMTP id t5sf28940291qti.5
        for <lists+jailhouse-dev@lfdr.de>; Fri, 19 Mar 2021 04:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20161025;
        h=sender:date:from:to:message-id:subject:mime-version
         :x-original-sender:precedence:mailing-list:list-id:list-post
         :list-help:list-archive:list-subscribe:list-unsubscribe;
        bh=oySa6bFi+Spoq6wRn0vJeILNbK8hPRfU5fU5DWM/Fqk=;
        b=smAHZZWjJP3nig8cScosrMKsKspksvBVQa1TC8F+bmP5XhsAT9UulTzPWn2gYi8gEc
         LmUrxezwACV6G09pybBdJbuCJYM+X0zmrjWDdx5eGmyveTmk9BodIUIO4pByoSjtCWTe
         yBQlBJNmCIQWmMk1qQuBEh1zvmRvRDrY1hrufjRigiXSBULVOEnFHA6jGPmrmd0TO3Ya
         BPoVPwwyyiHaqpXBvV9pOcIuIqvbsFtn396U77pxNnMGXYnCoVBc87k7azmxbKhcBVWj
         1B3KtY3Y2rxA17zigJf0XENfYbssp9DSwgRrkVlk2+Kux3cQ0dfpaTveOVEiRJ/YB3CS
         SttA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:message-id:subject:mime-version:x-original-sender
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oySa6bFi+Spoq6wRn0vJeILNbK8hPRfU5fU5DWM/Fqk=;
        b=pRuKKkBD+ucs7K8saxD1AyI3dEk+UozVJAIpZfsNLCjUOvNiJn8I2HxAvAkVEtcCDK
         k8wPIeof9rU7k1ap9crWpshmgmOtRoJowdK7Wy8pGtr6C0+ok1vAus5V4ssXBT3PnybK
         AERDTJqsumrFYAiig7q7upArxJ82GevcdIv2b5enA+wPJDdMu6l7CBCK76XIQ7OCWE7Y
         +u5PvyjOCHXCc0UlhSIYNL9lcbdbjN13NqjEodA1/dzDaqeKdpyV7FOF8ccGQ/4u7+TE
         hsSZbdEoqabwV+DypKU6Z4ygQbl2vkI2FVh7UEFdN/kyngoH8M0ma3QtwpZRZJhiNAWa
         5Q9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=sender:x-gm-message-state:date:from:to:message-id:subject
         :mime-version:x-original-sender:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=oySa6bFi+Spoq6wRn0vJeILNbK8hPRfU5fU5DWM/Fqk=;
        b=jMhHSiOWjQhsanucsWRxf+oBA6SdYJY6Q90xVPPN52+YeQJhiW7yPBM6o+TywcyU/z
         DR+ETJIQosbDkEU49w0Txb4bH5C5t9Wqps6l6EVul6ghRAK+urbC+psZL/nSmG0TUjO1
         cch1tjxKltb/iyLQRkEpynuTPAoJ3xxdrdjvO7o7ml3+3YD85wc2wTZnSjBQ0I5Y9J0R
         lgSzSK4gLGg4ShtzDMg1TGaqJOoPBmZvSEEMaekiiK08nzqSZdLOfNK/emOjoIHZ5Stc
         me/Bz9l8BWi49S4J6jxxeeFw7454xEHpe3gzUwcjmmj9/U8i94/9T4+HupRF5A7yTltl
         GZrA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM532/1wa95HcXx98rmSSpy+f4u/lKjF/E8E3hNx+kNXPRZEjVjhQT
	Bx5IvJHZXcKwi2bFFbQLXXc=
X-Google-Smtp-Source: ABdhPJyIezCaWT5hgLgSbInolgd6YJ10BI413XR1rHnHz2QJoMrcGNioxjDs25T6zra+SEe+DE+ijw==
X-Received: by 2002:a05:622a:110e:: with SMTP id e14mr7664495qty.335.1616151916557;
        Fri, 19 Mar 2021 04:05:16 -0700 (PDT)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:ac8:5810:: with SMTP id g16ls1988581qtg.11.gmail; Fri, 19
 Mar 2021 04:05:16 -0700 (PDT)
X-Received: by 2002:ac8:5156:: with SMTP id h22mr7671640qtn.260.1616151916034;
        Fri, 19 Mar 2021 04:05:16 -0700 (PDT)
Date: Fri, 19 Mar 2021 04:05:15 -0700 (PDT)
From: Smith li <v6543210@gmail.com>
To: Jailhouse <jailhouse-dev@googlegroups.com>
Message-Id: <e005673b-4a65-49ac-99db-6be233533fc5n@googlegroups.com>
Subject: jailhouse enable  failed on nuc6cayH
MIME-Version: 1.0
Content-Type: multipart/mixed; 
	boundary="----=_Part_1188_156160082.1616151915406"
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

------=_Part_1188_156160082.1616151915406
Content-Type: multipart/alternative; 
	boundary="----=_Part_1189_386937393.1616151915406"

------=_Part_1189_386937393.1616151915406
Content-Type: text/plain; charset="UTF-8"


my test jailhouse on nuc6cayH failed when enable jailhouse.

ReadMe  says
```As the device comes without a UART connector, the output of Jailhouse 
can only be seen via the EFI framebuffer on a monitor or on the virtual 
Jailhouse console (jailhouse console).
```
But  I find  my screen  is covered by a lot of green blocks.
no useful information.

What 's EFI framebuffer?  It 's shown on the screen or enable by some set?

The  image i used is compiled from  jailhouse-image. 
But it cann't execute normally. 

What's the matter. I'm confused.

-- 
You received this message because you are subscribed to the Google Groups "Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an email to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/jailhouse-dev/e005673b-4a65-49ac-99db-6be233533fc5n%40googlegroups.com.

------=_Part_1189_386937393.1616151915406
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><div>my test jailhouse on&nbsp;nuc6cayH failed when enable jailhouse.</=
div><div><br></div><div>ReadMe&nbsp; says</div><div>```As the device comes =
without a UART connector, the output of Jailhouse can only be seen via the =
EFI framebuffer on a monitor or on the virtual Jailhouse console (jailhouse=
 console).<br></div><div>```</div><div>But&nbsp; I find&nbsp; my screen&nbs=
p; is covered by a lot of green blocks.</div><div>no useful information.</d=
iv><div><br></div><div>What 's EFI framebuffer?&nbsp; It 's shown on the sc=
reen or enable by some set?</div><div><br></div><div>The&nbsp; image i used=
 is compiled from&nbsp; jailhouse-image.&nbsp;</div><div>But it cann't exec=
ute normally.&nbsp;</div><div><br></div><div>What's the matter. I'm confuse=
d.</div><div><br></div>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/e005673b-4a65-49ac-99db-6be233533fc5n%40googlegrou=
ps.com?utm_medium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/=
msgid/jailhouse-dev/e005673b-4a65-49ac-99db-6be233533fc5n%40googlegroups.co=
m</a>.<br />

------=_Part_1189_386937393.1616151915406--

------=_Part_1188_156160082.1616151915406--
