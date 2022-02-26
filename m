Return-Path: <jailhouse-dev+bncBAABB2HR4WIAMGQEC33MWZY@googlegroups.com>
X-Original-To: lists+jailhouse-dev@lfdr.de
Delivered-To: lists+jailhouse-dev@lfdr.de
Received: from mail-qt1-x840.google.com (mail-qt1-x840.google.com [IPv6:2607:f8b0:4864:20::840])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5004C52BF
	for <lists+jailhouse-dev@lfdr.de>; Sat, 26 Feb 2022 01:48:41 +0100 (CET)
Received: by mail-qt1-x840.google.com with SMTP id f13-20020ac8014d000000b002ddae786fb0sf3374599qtg.19
        for <lists+jailhouse-dev@lfdr.de>; Fri, 25 Feb 2022 16:48:41 -0800 (PST)
ARC-Seal: i=2; a=rsa-sha256; t=1645836520; cv=pass;
        d=google.com; s=arc-20160816;
        b=mlQGVnO77mNZIXUEWWbPUFDGPQZrouojY0DY7oGVWbYMVxrlNf9Jiiqc+KwYLig7Y5
         LYtnWYlGWJS0qMsiwdJnCKsC9l+FyZo7tVH539SFpookrjWiI50X0cGZikds5Suf6tob
         uQgDr+34Es86Sc8B9HuznTBFTWG3OLyrbSg0Czec+mSTPgcE0iTzZ1AIWwt+k7SJ81CL
         E/tE5ctbue8+yohukSVVxpQQJCvrkdbAWT3inhHZhiMs+EpyMJoJeJgC7mTp/idlRZML
         a9uPbSdsHA9xpm5VnZO97abyNAmy4CDH9ZP40HSaDvmKCBB2WzNq3hj8c38OR+QANwDt
         I/8g==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-unsubscribe:list-subscribe:list-archive:list-help:list-post
         :list-id:mailing-list:precedence:mime-version:in-reply-to:references
         :subject:from:date:message-id:sender:dkim-signature;
        bh=XDFrrOLEUYAsJbsmBdd13AvvBFxSfkWu+ZMSilAHDaA=;
        b=HuHJxgR/S3Rm1S4dnV2JbzJpqm3WjopikmZLTJ3j1ayUX9TEG/E6CfAPsH4NubphAB
         HCDtQdx/A0FbR9TgLVGAqQYc+V4LbqA36ToSwk65P6RFE8FHhI7MaP1Bc5f3yhP0sRl3
         TmkYLvJAc6b1s7eBp6v2Zb4EB4bSdtEq5eTIEIYs2h7gx8P9MJxfZ2il2klJUT7hp86S
         XHPByG4TZDzzWgJUzOx1nJDwpDmOGiwg8eCJqNkXssqvTgMTVQq9482Fhph2HWitRpNo
         Sf9w2bfYFoiIMRLLqGp5WhRsbxRiRBoXVozfhYGpjmuUU28AbdjF3Tn9sUAybpMMSz3Q
         jFfQ==
ARC-Authentication-Results: i=2; gmr-mx.google.com;
       spf=pass (google.com: domain of mjohnston@ihis.org designates 198.167.125.138 as permitted sender) smtp.mailfrom=mjohnston@ihis.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlegroups.com; s=20210112;
        h=sender:message-id:date:from:subject:references:in-reply-to
         :mime-version:x-original-sender:x-original-authentication-results
         :precedence:mailing-list:list-id:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XDFrrOLEUYAsJbsmBdd13AvvBFxSfkWu+ZMSilAHDaA=;
        b=SKxJuqJA12Gaj9tkzHAa6zv81KBSGq8BxMllHlCp7Bge6egaouk4VG4M1IQma+6yIL
         Un/GNTzIpRF6tvsEXfsY791yyMvqVKFZIynUxwWREtJCEmpUP3XLIxh8R7GNvdeEBKG7
         N0fVMBJIn4gAGdzLq5YlyhyY6EjXTew35W79YY6d2bfbEQS3DCmSjAgvFrpfsHEpsgKR
         WarT0N+84ZcwXOCJpyU3Xpeq4/B7JFfNVe22iIkhn9PSK6jH14tgenIx6Jy+ICDYrc45
         QyPjTJjynCZJpmNufSyXEktzJMFsLpO08M0YQ5n4O6llDVA1D4k3u1eAXzBA9R4K4kDt
         JhtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=sender:x-gm-message-state:message-id:date:from:subject:references
         :in-reply-to:mime-version:x-original-sender
         :x-original-authentication-results:precedence:mailing-list:list-id
         :x-spam-checked-in-group:list-post:list-help:list-archive
         :list-subscribe:list-unsubscribe;
        bh=XDFrrOLEUYAsJbsmBdd13AvvBFxSfkWu+ZMSilAHDaA=;
        b=zZCUuWLwaz7G2v8QThmxn4c8OgtVTITnbtSlfidmyYyZVtCtHyFbCqMud0l7AtKd08
         7TzSRCnNae3PJHpV52iSO/wU/a3dbnJqhJGDNuhtwNsb6c9r/MoabHkdqgDOWJrUqdK0
         JoBN3+ZKlxT3w1i70INPYA2aGrMU82HggAIbGwePd2Ye64lJf2ALO6liqeyxWhqtl4rA
         dqVPBPR/TuGnvBDWs202BAWFE4TiiiRVB94x1NFbwmjNg+PIVkehHbN4NmWODydDR9TQ
         ZCHeK1LlPPyweV/niPfaE61tuIxTv9JdQocz8wziGqDKAKKcyNsZ8Dz7/ej8o8HBRTIk
         PiDA==
Sender: jailhouse-dev@googlegroups.com
X-Gm-Message-State: AOAM533dNw/BrANI0Mj4zSMx7LpliM2+lagEO8d8/5/VKPOR+gRp6Wdg
	yDq9fCO0fg49z9OM9YxBwZE=
X-Google-Smtp-Source: ABdhPJyDRwXVuXFUPMyW36OdBd3duJAU9i+SJxHRqx7REIXjw2LYJ+yXNaiMj9kKjLLOsE+ft7/rtw==
X-Received: by 2002:a37:62d5:0:b0:47e:1755:2ad8 with SMTP id w204-20020a3762d5000000b0047e17552ad8mr6474272qkb.561.1645836520759;
        Fri, 25 Feb 2022 16:48:40 -0800 (PST)
X-BeenThere: jailhouse-dev@googlegroups.com
Received: by 2002:a05:622a:256:b0:2dd:d879:1c2c with SMTP id
 c22-20020a05622a025600b002ddd8791c2cls5699120qtx.5.gmail; Fri, 25 Feb 2022
 16:48:40 -0800 (PST)
X-Received: by 2002:ac8:7d96:0:b0:2de:b3ce:8a9d with SMTP id c22-20020ac87d96000000b002deb3ce8a9dmr5356062qtd.581.1645836520105;
        Fri, 25 Feb 2022 16:48:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1645836520; cv=none;
        d=google.com; s=arc-20160816;
        b=buvGgF32FrEpRQMpN1+vktnwLdo6+SDcb8EpQORULwdHzPshalyjILZnlii9RuG9nD
         IUquufzkSzId/zTBADHFy5AU2N86SWmfeb+kMy4TR1e0fn1RBtzAMOd5Ymyg1bmS+8iN
         9zBbrTy3R9gkXEYYl4hyQeNuTfcaucPbOIz9JBSJx4gjUVdWrnemPY8MW3yIRnnsYwbm
         V9mS5XA1vRC2c18RHs9yTw1qSb60sDrpgddq3MHjAX3w+smwsNBFfGjVCxaaYkgAp5eI
         G6FudSr0INS8/dPCjZXx7xCGyp2212t6DO7Lq8YggxCx/gS07IohEL9foHdbrKaKMtwD
         H/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=mime-version:in-reply-to:references:subject:from:date:message-id;
        bh=ULfb6aJyxdogKLyVUHTuATathD602C7NZMLn5kevhhs=;
        b=JsQi23YZfc2otmFaaw68JxnUzvR70muuOj9bxF7eZd5++pkmi29T+KnfD5WnFUr0ki
         9QaWzJIBP9p5Ucz2Xtcwr+ItBoUMUq04pQMTon/2uoay4zYhVoYH5TwWpqiNlWfzYeH6
         ZFcqvEXbLBT3U2xhliveGsTrA7/RckKPW6NydHh01y84V2kefj85YEE6kuxVeAIQIiiM
         8jFLRfZY4RjJbOiUtQXft+3SGwEmZlYCv7/Oq7WXxe7zIdjqowL78lLgMM87N+f/3hpf
         sLlnLayk0tc9xhIgHyri/ew/fHqYotA/sufN2NCxziG00xTkn9ieuuVr+EAtCPKSjb+q
         Ac2g==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
       spf=pass (google.com: domain of mjohnston@ihis.org designates 198.167.125.138 as permitted sender) smtp.mailfrom=mjohnston@ihis.org
Received: from smtp1.gov.pe.ca (smtp1.gov.pe.ca. [198.167.125.138])
        by gmr-mx.google.com with ESMTPS id j17-20020a05620a411100b0050705a90d37si287121qko.4.2022.02.25.16.48.40
        for <jailhouse-dev@googlegroups.com>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Feb 2022 16:48:40 -0800 (PST)
Received-SPF: pass (google.com: domain of mjohnston@ihis.org designates 198.167.125.138 as permitted sender) client-ip=198.167.125.138;
X-ASG-Debug-ID: 1645836485-156a374b2ce80af0001-DRBrOF
Received: from gwia-out.peigov (gtwy2.gov.pe.ca [198.167.37.75]) by smtp1.gov.pe.ca with ESMTP id 8NFPA8Dq7b9Qv2jH for <jailhouse-dev@googlegroups.com>; Fri, 25 Feb 2022 20:48:05 -0400 (AST)
X-Barracuda-Envelope-From: mjohnston@ihis.org
X-Barracuda-Effective-Source-IP: gtwy2.gov.pe.ca[198.167.37.75]
X-Barracuda-Apparent-Source-IP: 198.167.37.75
X-ASG-Whitelist: Client
Received: from GTWY2-MTA by gwia-out.peigov
	with Novell_GroupWise; Fri, 25 Feb 2022 20:48:05 -0400
Message-Id: <621978BF02000016000D33A9@gwia-out.peigov>
X-Mailer: Novell GroupWise Internet Agent 18.2.0
Date: Fri, 25 Feb 2022 20:47:59 -0400
From: "Melanie Johnston" <mjohnston@ihis.org>
Subject: Re: FYI
References: <6219744502000016000D2E98@gwia-out.peigov>
X-ASG-Orig-Subj: Re: FYI
In-Reply-To: <6219744502000016000D2E98@gwia-out.peigov>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=__PartC4C7B2AF.136__="
X-Barracuda-Connect: gtwy2.gov.pe.ca[198.167.37.75]
X-Barracuda-Start-Time: 1645836485
X-Barracuda-URL: https://198.167.125.138:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at gov.pe.ca
X-Barracuda-Scan-Msg-Size: 1615
X-Original-Sender: mjohnston@ihis.org
X-Original-Authentication-Results: gmr-mx.google.com;       spf=pass
 (google.com: domain of mjohnston@ihis.org designates 198.167.125.138 as
 permitted sender) smtp.mailfrom=mjohnston@ihis.org
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

This is a MIME message. If you are reading this text, you may want to 
consider changing to a mail reader or gateway that understands how to 
properly handle MIME multipart messages.

--=__PartC4C7B2AF.136__=
Content-Type: multipart/alternative; boundary="=__PartC4C7B2AF.137__="


--=__PartC4C7B2AF.137__=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable





>>> Melanie Johnston 02/25/22 4:28 PM >>>
You Have Been Picked, Contact ( geodert07@gmail.com ) for more details
















































































































-------------------------

Statement of Confidentiality

This message (including attachments) may contain confidential or privileged=
 information intended for a specific individual or organization. If you hav=
e received this communication in error, please notify the sender immediatel=
y. If you are not the intended recipient, you are not authorized to use, di=
sclose, distribute, copy, print or rely on this email, and should promptly =
delete this email from your entire computer system.






--=20
You received this message because you are subscribed to the Google Groups "=
Jailhouse" group.
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to jailhouse-dev+unsubscribe@googlegroups.com.
To view this discussion on the web visit https://groups.google.com/d/msgid/=
jailhouse-dev/621978BF02000016000D33A9%40gwia-out.peigov.

--=__PartC4C7B2AF.137__=
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Content-Description: HTML Document

<html><head><meta http-equiv=3DContent-Type content=3D"text/html; charset=
=3DUTF-8"><META name=3D"Author" content=3D"GroupWise WebAccess"><style type=
=3D"text/css">=20
body p=20
{=20
	margin: 0px;=20
}
</style></head><body style=3D'font-family: Helvetica, Arial, sans-serif; fo=
nt-size: 13px; '><div></div><div id=3D"GroupWiseSection_1645836470000_mjohn=
ston@ihis.org_3E42141009F7000089DFE5009C003800_" class=3D"GroupWiseMessageB=
ody"><br><span>&nbsp;</span><span class=3D"GroupwiseReplyHeader"><br><br>&g=
t;&gt;&gt; Melanie&nbsp;Johnston 02/25/22 4:28 PM &gt;&gt;&gt;<br></span><d=
iv>You Have Been Picked, Contact ( geodert07@gmail.com ) for more details</=
div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br=
><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><b=
r><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><=
br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>=
<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br=
><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br></div><br><htm=
l>

<body>



<p class=3DMsoPlainText>-------------------------</p>



<p class=3DMsoPlainText>Statement of Confidentiality</p>



<p class=3DMsoPlainText>This message (including attachments) may contain

confidential or privileged information intended for a specific individual o=
r

organization. If you have received this communication in error, please noti=
fy

the sender immediately. If you are not the intended recipient, you are not

authorized to use, disclose, distribute, copy, print or rely on this email,=
 and

should promptly delete this email from your entire computer system.</p>

<br>

<p class=3DMsoPlainText>D&eacute;claration de confidentialit&eacute;</p>

Le pr&eacute;sent message (y compris les annexes) peut contenir des renseig=
nements confidentiels &agrave; lintention d'une personne ou d'un organisme =
en particulier. Si vous avez re&ccedil;u la pr&eacute;sente communication p=
ar erreur, veuillez en informer l'exp&eacute;diteur imm&eacute;diatement. S=
i vous n'&ecirc;tes pas le destinataire pr&eacute;vu, vous n'avez pas le dr=
oit d'utiliser, de divulguer, de distribuer, de copier ou d'imprimer ce cou=
rriel ou encore de vous en servir, et vous devriez le supprimer compl&egrav=
e;tement de votre syst&egrave;me informatique.



</p>



<p class=3DMsoPlainText>-------------------------</p>





</body>

</html>


&nbsp;&nbsp;&shy;&shy;&nbsp;&nbsp;</body></html>

<p></p>

-- <br />
You received this message because you are subscribed to the Google Groups &=
quot;Jailhouse&quot; group.<br />
To unsubscribe from this group and stop receiving emails from it, send an e=
mail to <a href=3D"mailto:jailhouse-dev+unsubscribe@googlegroups.com">jailh=
ouse-dev+unsubscribe@googlegroups.com</a>.<br />
To view this discussion on the web visit <a href=3D"https://groups.google.c=
om/d/msgid/jailhouse-dev/621978BF02000016000D33A9%40gwia-out.peigov?utm_med=
ium=3Demail&utm_source=3Dfooter">https://groups.google.com/d/msgid/jailhous=
e-dev/621978BF02000016000D33A9%40gwia-out.peigov</a>.<br />

--=__PartC4C7B2AF.137__=--

--=__PartC4C7B2AF.136__=--
